% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function Detailed_Table = computeSDS_DetailedIndustry( ...
    PolyData, uniqueTypes, damageStates, filenames, ...
    Depth_Ranges, depthLabel, thr, folder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  STRUCTURAL DAMAGE STATE — DETAILED INDUSTRY COUNT (FINAL )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ===========================================================
%%  STEP 0 — BASIC SETUP
%% ===========================================================

N = numel(PolyData);

numBins   = numel(Depth_Ranges);   % 10 reporting bins
% Internal analysis uses:
% 0.5,1.0,1.5,...,10.0
numBins20 = 2*numBins;

numTypes  = numel(uniqueTypes);
numStates = numel(damageStates);

Summary = zeros(numBins, numTypes * numStates);

Depth = nan(N,1);
Types = strings(N,1);

%% ===========================================================
%%  STEP 1 — EXTRACT DEPTH AND TYPE
%% ===========================================================

for i = 1:N

    %  Depth
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

        %  FIXED: require scalar finite numeric value
        if isnumeric(d) && isscalar(d) && isfinite(d)

            Depth(i) = double(d);

        else

            Depth(i) = NaN;

        end

    end

    %  Type
    if isfield(PolyData(i),'type') && ~isempty(PolyData(i).type)

        Types(i) = string(PolyData(i).type);

    else

        Types(i) = "";

    end

end

%% ===========================================================
%%  STEP 2 — DEPTH BINNING
%% ===========================================================
%% 20-BIN DEPTH FRAMEWORK
%%
%% 0.5  -> Bin 1
%% 1.0  -> Bin 2
%% 1.5  -> Bin 3
%% ...
%% 10.0 -> Bin 20
%% ===========================================================

DepthBin = round(Depth * 2);

DepthBin(~isfinite(DepthBin) | ...
         DepthBin < 1 | ...
         DepthBin > numBins20) = NaN;

%% ===========================================================
%%  STEP 3 — BUILD SUMMARY MATRIX
%% ===========================================================

colIdx = 1;

for t = 1:numTypes

    currentType = string(uniqueTypes{t});

    maskT = strcmpi(Types, currentType);

    for s = 1:numStates

        fld = sprintf('%s_StructDamage', filenames{s});

        vals = nan(N,1);

        for i = 1:N

            if isfield(PolyData(i), fld)

                v = PolyData(i).(fld);

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

                %  FIXED: require scalar finite numeric value
                if isnumeric(v) && isscalar(v) && isfinite(v)

                    vals(i) = double(v);

                else

                    vals(i) = NaN;

                end

            end

        end

        %  No inundation → no damage
        vals(Depth == 0) = 0;

        %  Count exceedance
        for k = 1:numBins20

            Summary(k,colIdx) = ...
                sum(maskT & ...
                    (DepthBin == k) & ...
                    (vals >= thr));

        end

        colIdx = colIdx + 1;

    end

end

%% ===========================================================
%%  STEP 4 — BUILD MASTER TABLE
%% ===========================================================
%% AGGREGATE 20 ANALYSIS BINS TO 10 REPORTING BINS
%%
%% Reporting bins:
%%
%% 0-1 m  = 0.5 + 1.0
%% 1-2 m  = 1.5 + 2.0
%% 2-3 m  = 2.5 + 3.0
%% ...
%% 9-10 m = 9.5 + 10.0
%% ===========================================================

Summary_10 = zeros(numBins, numTypes*numStates);

for b = 1:numBins

    idx1 = 2*b - 1;
    idx2 = 2*b;

    Summary_10(b,:) = ...
        Summary(idx1,:) + ...
        Summary(idx2,:);

end

header = cell(1, numTypes * numStates);

idx = 1;

for t = 1:numTypes

    for s = 1:numStates

        header{idx} = sprintf('%s_%s', ...
            uniqueTypes{t}, ...
            damageStates{s});

        idx = idx + 1;

    end

end

header = matlab.lang.makeValidName(header);

Detailed_Table = array2table( ...
    Summary_10, ...
    'VariableNames', header);

Detailed_Table = addvars( ...
    Detailed_Table, ...
    Depth_Ranges(:), ...
    'Before',1, ...
    'NewVariableNames',depthLabel);

%% ===========================================================
%%  STEP 5 — SAVE PER DAMAGE STATE TABLES
%% ===========================================================

if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    for s = 1:numStates

        %  Select columns for this state
        colIdx = s : numStates : (numTypes * numStates);

        countsPerType = Summary_10(:,colIdx);

        totalCounts = sum(countsPerType,2);

        %  Build table
        DamageState_Count = table( ...
            Depth_Ranges(:), ...
            'VariableNames',{depthLabel});

        DamageState_Count.Total = totalCounts;

        DamageState_Count = [ ...
            DamageState_Count, ...
            array2table( ...
                countsPerType, ...
                'VariableNames', uniqueTypes)];

        %  Save CSV
        tableName = sprintf( ...
            'StructDamageState_%s_CountperDepth.csv', ...
            damageStates{s});

        writetable( ...
            DamageState_Count, ...
            fullfile(folder,tableName));

    end

end

%% ===========================================================
%%  STEP 6 — SAVE MASTER TABLE
%% ===========================================================

if ~isempty(folder)

    writetable( ...
        Detailed_Table, ...
        fullfile(folder, ...
        'StructDamage_Detailed_AllTypes.csv'));

end

end