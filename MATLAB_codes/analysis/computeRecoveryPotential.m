% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.


function [PolyData, Detailed_Recovery, RecoveryOverview, Summary_RecoveryPotential] = ...
    computeRecoveryPotential(PolyData, RecoveryTable, Depth_Ranges, thr, folder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RECOVERY POTENTIAL ANALYSIS (20 DEPTH BINS)
%
% Assumes:
%   DepthGroup = 0, 0.5, 1.0, 1.5, ..., 10.0
%
% Recovery reference table contains:
%   20 rows (months)
%   3 probability columns:
%       No Inundation
%       Depth < 3 m
%       Depth >= 3 m
%
% Workflow:
%   1. Assign monthly recovery probabilities.
%   2. Count structures exceeding threshold.
%   3. Count per 20 depth bins.
%   4. Aggregate back into:
%        No Inundation
%        Less than or equal to 3 m
%        Greater than 3 m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = numel(PolyData);

RefTable = RecoveryTable;

if isempty(RefTable) || ~istable(RefTable)
    error('RecoveryTable must be a valid table');
end

%% ===========================================================
%% 1) MONTH FIELDS
%% ===========================================================
%
% Recovery reference table contains 20 rows:
%
% Row  1 = 0.0 - 0.5 months
% Row  2 = 0.5 - 1.0 months
% Row  3 = 1.0 - 1.5 months
% ...
% Row 20 = 9.5 - 10.0 months
%
% MATLAB field names cannot contain "." so:
%
% 0.5 becomes 0p5
%
% Example:
%
% RecoveryPotential_0p5to1mos
% RecoveryPotential_1to1p5mos
%
%% ===========================================================

nMonths = min(20,height(RefTable));

monthFields = cell(nMonths,1);
Months_Ranges = strings(nMonths,1);

for m = 1:nMonths

    startMonth = (m-1)*0.5;
    endMonth   = m*0.5;

    % Replace decimal point with "p" for valid field names
    startStr = strrep(num2str(startMonth,'%g'),'.','p');
    endStr   = strrep(num2str(endMonth,'%g'),'.','p');

    monthFields{m} = sprintf( ...
        'RecoveryPotential_%sto%smos', ...
        startStr, ...
        endStr);

    Months_Ranges(m) = sprintf( ...
        '(%.1f - %.1f]', ...
        startMonth, ...
        endMonth);

    [PolyData.(monthFields{m})] = deal(NaN);

end

Months_Ranges_categorical = categorical(Months_Ranges);

%% ===========================================================
%% 2) EXTRACT PROBABILITY COLUMNS
%% ===========================================================
vars = RefTable.Properties.VariableNames;
if numel(vars) < 4
    error('RecoveryTable must contain 4 columns: Months, No Inundation, Depth <= 3 m, Depth > 3 m');
end

%% ===========================================================
%% 2B) SAVE RECOVERY REFERENCE TABLE
%% ===========================================================
if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    writetable( ...
        RefTable, ...
        fullfile(folder, ...
        'ReferenceTable_RecoveryPotential.csv'));

end


%% ===========================================================
%% 3) NORMALISE DEPTH
%%
%% DepthGroup values use the 20-bin framework:
%%
%% 0
%% 0.5
%% 1.0
%% 1.5
%% ...
%% 10.0
%% ===========================================================
DepthGroup = nan(N,1);

for i = 1:N

    if isfield(PolyData(i),'DepthGroup')

        d = PolyData(i).DepthGroup;

        if iscell(d)
            d = d{1};
        end

        if isstring(d) || ischar(d)
            d = str2double(d);
        end

        if isnumeric(d) && isfinite(d)
            DepthGroup(i) = double(d);
        end

    end

end

%% ===========================================================
%% 4) DEPTH MASKS
%% ===========================================================
mask1 = (DepthGroup == 0);

mask2 = (DepthGroup > 0 & DepthGroup <= 3);

mask3 = (DepthGroup > 3);

%% ===========================================================
%% 5) ASSIGN MONTHLY PROBABILITIES
%%
%% For each row of the Recovery reference table:
%%
%% Column 1 = Months
%% Column 2 = No Inundation
%% Column 3 = Depth < 3 m
%% Column 4 = Depth >= 3 m
%%
%% Example:
%% Row 1:
%%   DepthGroup == 0      -> value from Row 1, Col 2
%%   0 < DepthGroup < 3   -> value from Row 1, Col 3
%%   DepthGroup >= 3      -> value from Row 1, Col 4
%%
%% Row 2:
%%   DepthGroup == 0      -> value from Row 2, Col 2
%%   etc.
%% ===========================================================
for r = 1:nMonths

    fld = monthFields{r};

    vec = nan(N,1);

    rowVals = RefTable{r,:};

    prob_NoInundation = rowVals(2);
    prob_LessThan3m   = rowVals(3);
    prob_MoreThan3m   = rowVals(4);

    vec(mask1) = prob_NoInundation;
    vec(mask2) = prob_LessThan3m;
    vec(mask3) = prob_MoreThan3m;

    valsCell = num2cell(vec);

    [PolyData.(fld)] = valsCell{:};

end
%% ===========================================================
%% 6) DEPTH BINNING (20 DEPTH BINS)
%% ===========================================================
numBins = numel(Depth_Ranges);

% Internal analysis uses 20 depth bins
numBins20 = 2 * numBins;

DepthBin = round(DepthGroup * 2);

DepthBin(~isfinite(DepthBin) | ...
         DepthBin < 1 | ...
         DepthBin > numBins20) = NaN;

%% ===========================================================
%% 7) COUNT PER DEPTH PER MONTH
%% ===========================================================
Summary_Reco = zeros(numBins20,nMonths);

for c = 1:nMonths

    fld = monthFields{c};

    vals = nan(N,1);

    for i = 1:N

        if isfield(PolyData(i),fld)

            v = PolyData(i).(fld);

            if iscell(v)
                v = v{1};
            end

            if isstring(v) || ischar(v)
                v = str2double(v);
            end

            if isnumeric(v) && isfinite(v)
                vals(i) = double(v);
            end

        end

    end

    meetsThr = vals >= thr;

    for k = 1:numBins20

        Summary_Reco(k,c) = ...
            sum(meetsThr & (DepthBin == k));

    end

end

%% ===========================================================
%% 8) SAVE DETAILED DEPTH TABLE (10 REPORTING BINS)
%%
%% Analysis is performed using 20 bins:
%%   0.5, 1.0, 1.5, ..., 10.0 m
%%
%% Reporting is aggregated back to 10 bins:
%%   0-1, 1-2, 2-3, ..., 9-10 m
%% ===========================================================

Summary_Reco_10 = zeros(10,nMonths);

for b = 1:10

    idx1 = 2*b - 1;
    idx2 = 2*b;

    if idx2 <= size(Summary_Reco,1)

        Summary_Reco_10(b,:) = ...
            Summary_Reco(idx1,:) + ...
            Summary_Reco(idx2,:);

    end

end

DepthCol = string({ ...
    '0-1 m'
    '1-2 m'
    '2-3 m'
    '3-4 m'
    '4-5 m'
    '5-6 m'
    '6-7 m'
    '7-8 m'
    '8-9 m'
    '9-10 m'});

DetailedDepthTable = array2table( ...
    Summary_Reco_10, ...
    'VariableNames', ...
    matlab.lang.makeValidName(monthFields));

DetailedDepthTable = addvars( ...
    DetailedDepthTable, ...
    DepthCol, ...
    'Before',1, ...
    'NewVariableNames','Depth');
%% ===========================================================
%% 9) AGGREGATE TO 3 DEPTH DIVISIONS
%% ===========================================================
sum_zero = zeros(1,nMonths);

for c = 1:nMonths

    fld = monthFields{c};

    vals = nan(N,1);

    for i = 1:N

        if isfield(PolyData(i),fld)

            v = PolyData(i).(fld);

            if iscell(v)
                v = v{1};
            end

            if isstring(v) || ischar(v)
                v = str2double(v);
            end

            if isnumeric(v) && isfinite(v)
                vals(i) = double(v);
            end

        end

    end

    meetsThr = vals >= thr;

    sum_zero(c) = sum(meetsThr & (DepthGroup == 0));

end

idx_lt3 = 1:5;      % 0.5 to 2.5 m

idx_ge3 = 6:20;     % 3.0 to 10.0 m

sum_lt3 = sum(Summary_Reco(idx_lt3,:),1);

sum_ge3 = sum(Summary_Reco(idx_ge3,:),1);

combined = [ ...
    sum_zero; ...
    sum_lt3; ...
    sum_ge3];

Total = sum_zero + sum_lt3 + sum_ge3;

%% ===========================================================
%% 10) BUILD 3-DEPTH TABLE
%% ===========================================================
Cols = combined.';

TotalCol = Total(:);

Detailed_Recovery = table( ...
    Months_Ranges_categorical, ...
    TotalCol, ...
    Cols(:,1), ...
    Cols(:,2), ...
    Cols(:,3), ...
    'VariableNames',{ ...
    'Months', ...
    'Total_Buildings', ...
    'No_Inundation', ...
    'Less_than_3m', ...
    'More_than_3m'});

%% ===========================================================
%% 11) OVERVIEW (TOTAL ONLY)
%% ===========================================================
RecoveryOverview = table( ...
    Months_Ranges_categorical, ...
    TotalCol, ...
    'VariableNames',{'Months','Total'});

%% ===========================================================
%% 11B) RECOVERY MILESTONES TABLE
%%
%% Row 1 = First month where recovery begins
%% Row 2 = First month where all structures recover
%% ===========================================================

idxFirstRecovery = find(TotalCol > 0, 1, 'first');

idxFullRecovery = find(TotalCol >= N, 1, 'first');

FirstRecoveryMonth = "Not Reached";
FirstRecoveryCount = 0;

if ~isempty(idxFirstRecovery)

    FirstRecoveryMonth = string( ...
        Months_Ranges(idxFirstRecovery));

    FirstRecoveryCount = ...
        TotalCol(idxFirstRecovery);

end

FullRecoveryMonth = "Not Reached";
FullRecoveryCount = 0;

if ~isempty(idxFullRecovery)

    FullRecoveryMonth = string( ...
        Months_Ranges(idxFullRecovery));

    FullRecoveryCount = ...
        TotalCol(idxFullRecovery);

end

RecoverySummaryPage = table( ...
    ["Start of Recovery"; ...
     "Full Recovery"], ...
    [FirstRecoveryMonth; ...
     FullRecoveryMonth], ...
    [FirstRecoveryCount; ...
     FullRecoveryCount], ...
    'VariableNames',{ ...
    'Potential Recovery', ...
    'Month', ...
    'Structure_Count'});

%% ===========================================================
%% 12) SAVE CSV FILES
%% ===========================================================
if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    writetable( ...
        DetailedDepthTable, ...
        fullfile(folder, ...
        'RecoveryPotential_CountPerDepth_DetailedDepth.csv'));

    writetable( ...
        Detailed_Recovery, ...
        fullfile(folder, ...
        'RecoveryPotential_CountPerDepth_3DepthDivisions.csv'));

    writetable( ...
        RecoveryOverview, ...
        fullfile(folder, ...
        'RecoveryPotential_Overview.csv'));

    writetable( ...
    RecoverySummaryPage, ...
    fullfile(folder, ...
    'RecoveryPotential_SummaryPage.csv'));
end

%% ===========================================================
%% OUTPUT USED BY PLOTS
%%
%% Row 1 = No Inundation
%% Row 2 = Less than 3 m
%% Row 3 = Greater than or equal to 3 m
%% ===========================================================
Summary_RecoveryPotential = combined;

end