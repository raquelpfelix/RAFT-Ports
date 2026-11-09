% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.


function [Summary_ProbExc, Summary_Table, app] = computeSDS_Summary( ...
    app, PolyData, filenames, Depth_Ranges, depthLabel, thr, folder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  STRUCTURAL DAMAGE STATE — SUMMARY PER DEPTH BIN (STABLE )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ===========================================================
%%  STEP 0 — BASIC SETUP
%% ===========================================================

N = numel(PolyData);

numBins   = numel(Depth_Ranges);
numStates = numel(filenames);

numBins20 = 2*numBins;

Summary_ProbExc = zeros(numBins20, numStates);

%% ===========================================================
%%  STEP 1 — EXTRACT DEPTH (SAFE )
%% ===========================================================

Depth = nan(N,1);

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

        %  FIXED: require scalar finite numeric value
        if isnumeric(d) && isscalar(d) && isfinite(d)

            Depth(i) = double(d);

        else

            Depth(i) = NaN;

        end

    end

end

%% ===========================================================
%%  STEP 2 — BINNING
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
         DepthBin > (2*numBins)) = NaN;
%% ===========================================================
%%  STEP 3 — DAMAGE LOOP (SAFE )
%% ===========================================================

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
        Summary_ProbExc(k,s) = ...
            sum((vals >= thr) & (DepthBin == k));

    end

end

%% ===========================================================
%%  STEP 4 — BUILD DEPTH TABLE
%% ===========================================================

%% ===========================================================
%% STEP 4 — AGGREGATE 20 DEPTH BINS INTO 10 REPORTING BINS
%%
%% Reporting:
%%
%% 0-1 m  = 0.5 + 1.0
%% 1-2 m  = 1.5 + 2.0
%% 2-3 m  = 2.5 + 3.0
%% ...
%% 9-10 m = 9.5 + 10.0
%% ===========================================================

Summary_ProbExc_10 = zeros(numBins,numStates);

for b = 1:numBins

    idx1 = 2*b - 1;
    idx2 = 2*b;

    Summary_ProbExc_10(b,:) = ...
        Summary_ProbExc(idx1,:) + ...
        Summary_ProbExc(idx2,:);

end

varNames = matlab.lang.makeValidName(string(filenames));

Summary_Table = array2table( ...
    Summary_ProbExc_10, ...
    'VariableNames', cellstr(varNames));

Summary_Table = addvars( ...
    Summary_Table, ...
    Depth_Ranges(:), ...
    'Before',1, ...
    'NewVariableNames',depthLabel);


%% ===========================================================
%%  STEP 5 — SAVE INTO APP
%% ===========================================================

if ~isempty(app)

    app.Summary_ProbExc       = Summary_ProbExc;
    app.Summary_ProbExc_Table = Summary_Table;

end

%% ===========================================================
%%  STEP 6 — SAVE CSVs
%% ===========================================================

if ~isempty(folder)

    if ~exist(folder,'dir')
        mkdir(folder);
    end

    % ----------------------------------------------
    %  DEPTH TABLE
    % ----------------------------------------------
    writetable( ...
        Summary_Table, ...
        fullfile(folder, ...
        'StructDamageState_Overview_CountPerDepth.csv'));

    % ----------------------------------------------
    %  TOTAL SUMMARY TABLE
    % ----------------------------------------------
% -------------------------------------------------------
% Use the aggregated 10-bin reporting table when
% computing overview totals.
%
% This ensures consistency between:
%   StructDamageState_Overview.csv
% and
%   StructDamageState_Overview_CountPerDepth.csv
% -------------------------------------------------------
colSums = sum(Summary_ProbExc_10,1);

    Summary_Total_Table = array2table( ...
        colSums, ...
        'VariableNames', cellstr(varNames));

    writetable( ...
        Summary_Total_Table, ...
        fullfile(folder, ...
        'StructDamageState_Overview.csv'));

    %  Store in app if available
    if ~isempty(app)
        app.Summary_ProbExc_Total = Summary_Total_Table;
    end

end

end