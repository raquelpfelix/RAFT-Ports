% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function [InundationCount, InundationSummary, rangeMatrix, ...
          headerNoDepth, uniqueTypes] = ...
          computeInundationCounts(PolyData, typesMaster, ...
          Depth_Ranges, depthLabel, outputFolder)

%% ===========================================================
%% STEP 0 — BASIC VALIDATION
%% ===========================================================
if isempty(PolyData) || ~isstruct(PolyData)

    InundationCount   = table();
    InundationSummary = table();
    rangeMatrix       = [];
    headerNoDepth     = {};
    uniqueTypes       = {};

    return;

end

%% ===========================================================
%% STEP 1 — EXTRACT DEPTH GROUPS AND TYPES
%% ===========================================================
n = numel(PolyData);

rawDepthGroups = nan(n,1);
rawTypes       = strings(n,1);

for i = 1:n

    if isfield(PolyData(i),'DepthGroup')

        v = PolyData(i).DepthGroup;

        if isnumeric(v) && isfinite(v)
            rawDepthGroups(i) = double(v);
        end

    end

    if isfield(PolyData(i),'type') && ...
            ~isempty(PolyData(i).type)

        rawTypes(i) = string(PolyData(i).type);

    else

        rawTypes(i) = "";

    end

end

%% ===========================================================
%% STEP 2 — STANDARDISE TYPE NAMES
%% ===========================================================
canon = @(s) regexprep( ...
    lower(strtrim(string(s))), ...
    '[^a-z0-9]+','');

polyTypesCanon = arrayfun(canon, rawTypes);

typesMaster      = string(typesMaster(:));
typesMasterCanon = arrayfun(canon, typesMaster);

%% ===========================================================
%% STEP 3 — DEPTH BIN INDEX FROM DEPTHGROUP
%%
%% Assumes:
%% DepthGroup = 0.5,1,1.5,...,10
%%
%% Converts:
%% 0.5 -> 1
%% 1.0 -> 1
%% 1.5 -> 2
%% 2.0 -> 2
%% ...
%% 9.5 -> 10
%% 10.0 -> 10
%%
%% Therefore:
%% 20 depth groups are aggregated into 10 inundation bins.
%% ===========================================================

numBins = numel(Depth_Ranges);

DepthGroupBins = ceil(rawDepthGroups);

DepthGroupBins(isnan(rawDepthGroups) | ...
               rawDepthGroups <= 0) = NaN;

DepthGroupBins(DepthGroupBins < 1 | ...
               DepthGroupBins > numBins) = NaN;

%% ===========================================================
%% STEP 4 — TOTAL COUNTS PER DEPTH BIN
%% ===========================================================
countsAll = accumarray( ...
    DepthGroupBins(~isnan(DepthGroupBins)), ...
    1, ...
    [numBins 1], ...
    @sum, ...
    0);

%% ===========================================================
%% STEP 5 — TYPES PRESENT IN DATA
%% ===========================================================
presentMask = ismember( ...
    typesMasterCanon, ...
    unique(polyTypesCanon));

uniqueTypes      = typesMaster(presentMask);
uniqueTypesCanon = typesMasterCanon(presentMask);

numSel = numel(uniqueTypes);

%% ===========================================================
%% STEP 6 — COUNTS PER TYPE
%% ===========================================================
typeCounts = zeros(numBins,numSel);

for t = 1:numSel

    maskT = strcmp( ...
        polyTypesCanon, ...
        uniqueTypesCanon(t));

    binsT = DepthGroupBins(maskT);

    binsT = binsT(~isnan(binsT));

    if ~isempty(binsT)

        typeCounts(:,t) = accumarray( ...
            binsT, ...
            1, ...
            [numBins 1], ...
            @sum, ...
            0);

    end

end

%% ===========================================================
%% STEP 7 — OTHERS CATEGORY
%% ===========================================================
isSel = ismember( ...
    polyTypesCanon, ...
    uniqueTypesCanon);

otherMask = ~isSel;

binsOther = DepthGroupBins(otherMask);

binsOther = binsOther(~isnan(binsOther));

if ~isempty(binsOther)

    countsOther = accumarray( ...
        binsOther, ...
        1, ...
        [numBins 1], ...
        @sum, ...
        0);

else

    countsOther = zeros(numBins,1);

end

%% ===========================================================
%% STEP 8 — BUILD MATRIX
%% ===========================================================
rangeMatrix   = [countsAll, typeCounts];

headerNoDepth = [ ...
    {'total'}, ...
    cellstr(uniqueTypes') ...
    ];

if any(countsOther ~= 0)

    rangeMatrix = [ ...
        rangeMatrix, ...
        countsOther ...
        ];

    headerNoDepth = [ ...
        headerNoDepth, ...
        {'others'} ...
        ];

end

headerNoDepth = matlab.lang.makeValidName(headerNoDepth);

%% ===========================================================
%% STEP 9 — BUILD OUTPUT TABLE
%% ===========================================================
DepthCol = string(Depth_Ranges(:));

safeDepthVar = matlab.lang.makeValidName(depthLabel);

InundationCount = [ ...
    table(DepthCol,'VariableNames',{safeDepthVar}), ...
    array2table( ...
    rangeMatrix, ...
    'VariableNames',headerNoDepth) ...
    ];

%% ===========================================================
%% STEP 10 — SUMMARY TABLE
%% ===========================================================
inundationTotal = sum(rangeMatrix,1);

InundationSummary = array2table( ...
    inundationTotal, ...
    'VariableNames', ...
    headerNoDepth);

%% ===========================================================
%% STEP 11 — SAVE OUTPUTS
%% ===========================================================
if ~isempty(outputFolder)

    if ~exist(outputFolder,'dir')
        mkdir(outputFolder);
    end

    writetable( ...
        InundationCount, ...
        fullfile( ...
        outputFolder, ...
        'InundationDetailedCount.csv'));

    writetable( ...
        InundationSummary, ...
        fullfile( ...
        outputFolder, ...
        'Inundation_Overview.csv'));

end

end