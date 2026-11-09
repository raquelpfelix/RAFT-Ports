% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.


function [PolyData, Detailed_LossRatio_Table, Summary_LossRatio] = ...
    computeLossRatio(PolyData, LossTable, uniqueTypes, ...
    Depth_Ranges, thr, folder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOSS RATIO ANALYSIS (20 DEPTH BINS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = numel(PolyData);

% -------------------------------------------------------
% Reporting uses 10 depth intervals:
%   0-1 m, 1-2 m, ..., 9-10 m
%
% Internal analysis uses 20 depth bins:
%   0.5, 1.0, 1.5, ..., 10.0 m
% -------------------------------------------------------
numBins   = numel(Depth_Ranges);
numBins20 = 2*numBins;

numTypes = numel(uniqueTypes);

%% ===========================================================
%% STEP 1 — PREPARE REFERENCE TABLE
%% ===========================================================
ReferenceTable_LossRatio = LossTable;

if ~istable(ReferenceTable_LossRatio)
    error('LossTable must be a table');
end

%% ===========================================================
%% SAVE REFERENCE TABLE
%% ===========================================================
if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    writetable( ...
        ReferenceTable_LossRatio, ...
        fullfile(folder, ...
        'ReferenceTable_LossRatio.csv'));

end


tableVars = string( ...
    ReferenceTable_LossRatio.Properties.VariableNames);

%% ===========================================================
%% STEP 2 — ASSIGN LOSS RATIO TO POLYDATA
%% ===========================================================
for t = 1:numTypes

    currentType = string(uniqueTypes{t});

    matchIdx = find(strcmpi(tableVars,currentType),1);

    if isempty(matchIdx)
        warning('No matching column for type: %s',currentType);
        continue;
    end

    varName = tableVars(matchIdx);

    colData = ReferenceTable_LossRatio.(varName);

    if iscell(colData)

        colData = str2double(string(colData));

    elseif isstring(colData) || ischar(colData)

        colData = str2double(colData);

    else

        colData = double(colData);

    end

    colData(~isfinite(colData)) = NaN;

    for i = 1:N

        if ~isfield(PolyData(i),'type') || ...
                ~strcmpi(string(PolyData(i).type),currentType)
            continue;
        end

        if ~isfield(PolyData(i),'DepthGroup')
            continue;
        end

        d = PolyData(i).DepthGroup;

        if iscell(d)

            if ~isempty(d)
                d = d{1};
            else
                d = NaN;
            end

        end

        if isstring(d) || ischar(d)
            d = str2double(d);
        end

        if ~isnumeric(d) || ~isscalar(d) || ~isfinite(d)
            continue;
        end

        % No inundation
        if d == 0

            PolyData(i).LossRatio = 0;
            continue;

        end

        % -------------------------------------------------------
        % Convert DepthGroup to a row in the Loss Ratio table.
        %
        % DepthGroup values are assigned in 0.5 m increments:
        %   0.5, 1.0, 1.5, 2.0, ..., 10.0
        %
        % The Loss Ratio reference table contains 20 rows
        % corresponding to these depths:
        %
        %   Row  1 = 0.5 m
        %   Row  2 = 1.0 m
        %   Row  3 = 1.5 m
        %   ...
        %   Row 20 = 10.0 m
        %
        % Example:
        %   DepthGroup = 3.5 m  -> Row 7
        %   DepthGroup = 7.0 m  -> Row 14
        % -------------------------------------------------------
        rowIndex = round(d * 2);

        % Prevent indexing beyond table limits
        rowIndex = min(rowIndex,numel(colData));
        if rowIndex >= 1 && rowIndex <= numel(colData)

            PolyData(i).LossRatio = colData(rowIndex);

        else

            PolyData(i).LossRatio = NaN;

        end

    end

end

%% ===========================================================
%% STEP 3 — EXTRACT DEPTH + TYPE
%% ===========================================================
DepthGroup = nan(N,1);
Types      = strings(N,1);

for i = 1:N

    if isfield(PolyData(i),'DepthGroup')

        d = PolyData(i).DepthGroup;

        if iscell(d)

            if ~isempty(d)
                d = d{1};
            else
                d = NaN;
            end

        end

        if isstring(d) || ischar(d)
            d = str2double(d);
        end

        if isnumeric(d) && isscalar(d) && isfinite(d)
            DepthGroup(i) = double(d);
        end

    end

    if isfield(PolyData(i),'type')
        Types(i) = string(PolyData(i).type);
    else
        Types(i) = "";
    end

end

% -------------------------------------------------------
% Convert DepthGroup to a depth-bin index.
%
% This creates 20 depth bins:
%
%   Bin  1 = 0.5 m
%   Bin  2 = 1.0 m
%   Bin  3 = 1.5 m
%   ...
%   Bin 20 = 10.0 m
%
% These bins are used to count buildings per depth
% range and per industry type.
% -------------------------------------------------------

DepthBin = round(DepthGroup * 2);

DepthBin(~isfinite(DepthBin) | ...
         DepthBin < 1 | ...
         DepthBin > numBins20) = NaN;

%% ===========================================================
%% STEP 4 — COUNT PER TYPE + DEPTH
%% ===========================================================
Summary_LossRatio = zeros(numBins20,numTypes);

for t = 1:numTypes

    currentType = string(uniqueTypes{t});

    typeMask = strcmpi(Types,currentType);

    vals = nan(N,1);

    for i = 1:N

        if DepthGroup(i) == 0

            vals(i) = 0;
            continue;

        end

        if isfield(PolyData(i),'LossRatio')

            v = PolyData(i).LossRatio;

            if iscell(v)

                if ~isempty(v)
                    v = v{1};
                else
                    v = NaN;
                end

            end

            if isstring(v) || ischar(v)
                v = str2double(v);
            end

            if isnumeric(v) && isscalar(v) && isfinite(v)

                vals(i) = double(v);

            else

                vals(i) = NaN;

            end

        end

    end

    % -------------------------------------------------------
    % Count buildings whose Loss Ratio probability equals
    % or exceeds the user-defined threshold.
    %
    % Example:
    %   thr = 0.5
    %
    % A structure with:
    %   LossRatio = 0.60 -> counted
    %   LossRatio = 0.40 -> not counted
    % -------------------------------------------------------

    meetsThr = (vals >= thr) & isfinite(vals);

    for k = 1:numBins20

        Summary_LossRatio(k,t) = ...
            sum((DepthBin == k) & typeMask & meetsThr);

    end

end

%% ===========================================================
%% STEP 5 — AGGREGATE 20 DEPTH BINS TO 10 REPORTING BINS
%%
%% Reporting:
%%
%% 0-1 m  = 0.5 + 1.0
%% 1-2 m  = 1.5 + 2.0
%% 2-3 m  = 2.5 + 3.0
%% ...
%% 9-10 m = 9.5 + 10.0
%% ===========================================================

Summary_LossRatio_10 = zeros(numBins,numTypes);

for b = 1:numBins

    idx1 = 2*b - 1;
    idx2 = 2*b;

    Summary_LossRatio_10(b,:) = ...
        Summary_LossRatio(idx1,:) + ...
        Summary_LossRatio(idx2,:);

end

Total_LossRatio = sum(Summary_LossRatio_10,2);

varNames = matlab.lang.makeValidName(string(uniqueTypes));

Detailed_LossRatio_Table = array2table( ...
    Summary_LossRatio_10, ...
    'VariableNames',cellstr(varNames));

Detailed_LossRatio_Table = addvars( ...
    Detailed_LossRatio_Table, ...
    Depth_Ranges(:), ...
    'Before',1, ...
    'NewVariableNames','Depth');

Detailed_LossRatio_Table = addvars( ...
    Detailed_LossRatio_Table, ...
    Total_LossRatio, ...
    'After','Depth', ...
    'NewVariableNames','Total');

%% ===========================================================
%% STEP 6 — SAVE
%% ===========================================================
if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    % -------------------------------------------------------
    % Save detailed 10-bin reporting table
    % -------------------------------------------------------
    writetable( ...
        Detailed_LossRatio_Table, ...
        fullfile(folder, ...
        'LossRatio_DetailedIndustry_CountPerDepth.csv'));

    % -------------------------------------------------------
    % Overview totals based on the aggregated
    % 10-bin reporting matrix
    % -------------------------------------------------------
    OverallTotal = sum(sum(Summary_LossRatio_10));

    TypeTotals = sum(Summary_LossRatio_10,1);

    LossRatio_Overview_Table = array2table( ...
        [OverallTotal, TypeTotals], ...
        'VariableNames', ...
        ['total', cellstr(varNames(:)')]);

    writetable( ...
        LossRatio_Overview_Table, ...
        fullfile(folder, ...
        'LossRatio_Overview.csv'));

end

end