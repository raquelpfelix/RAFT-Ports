% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function inputs = buildInputs(app)


    inputs = struct();

    %% -------------------------------
    %%  PolyData (REQUIRED)
    %% -------------------------------
    if isempty(app.PolyData)
        error('PolyData is empty. Run preprocessing first.');
    end

    inputs.PolyData = app.PolyData;

    %% -------------------------------
    %%  TYPES
    %% -------------------------------
    inputs.typesMaster = app.typesMaster;

    %% -------------------------------
    %%  SDS TABLES
    %% -------------------------------
    inputs.tables.sdsTables = { ...
        app.Table_MinorSDS, ...
        app.Table_ModerateSDS, ...
        app.Table_MajorSDS, ...
        app.Table_DestroyedSDS };

    %% =======================================================
    %%  LOSS TABLE (FINAL  — ACCEPTS TABLE )
    %% =======================================================
    lossRaw  = app.Table_LossRatio.Data;
    lossCols = app.Table_LossRatio.ColumnName;

    if isempty(lossRaw)
        warning('Loss table is empty — skipping Loss analysis.');
        inputs.tables.Loss = [];

    else

        %  Accept TABLE directly (MAIN CASE )
        if istable(lossRaw)

            lossTable = lossRaw;

        %  Numeric → convert
        elseif isnumeric(lossRaw)

            lossTable = array2table(lossRaw, ...
                'VariableNames', matlab.lang.makeValidName(string(lossCols)));

        %  Cell → convert
        elseif iscell(lossRaw)

            lossTable = cell2table(lossRaw, ...
                'VariableNames', matlab.lang.makeValidName(string(lossCols)));

        else
            error('Loss table must be table, numeric, or cell.');
        end

        %  Clean column names (critical)
        lossTable.Properties.VariableNames = ...
            matlab.lang.makeValidName(lossTable.Properties.VariableNames);

        inputs.tables.Loss = lossTable;
    end

    %% =======================================================
    %%  RECOVERY TABLE (FINAL  — ACCEPTS TABLE )
    %% =======================================================
    recRaw  = app.Table_RecoveryPotential.Data;
    recCols = app.Table_RecoveryPotential.ColumnName;

    if isempty(recRaw)
        warning('Recovery table is empty — skipping Recovery analysis.');
        inputs.tables.Recovery = [];

    else

        if istable(recRaw)

            recTable = recRaw;

        elseif isnumeric(recRaw)

            recTable = array2table(recRaw, ...
                'VariableNames', matlab.lang.makeValidName(string(recCols)));

        elseif iscell(recRaw)

            recTable = cell2table(recRaw, ...
                'VariableNames', matlab.lang.makeValidName(string(recCols)));

        else
            error('Recovery table must be table, numeric, or cell.');
        end

        recTable.Properties.VariableNames = ...
            matlab.lang.makeValidName(recTable.Properties.VariableNames);

        inputs.tables.Recovery = recTable;

        %%  MATCH RECOVERY COLUMN NAMES (CRITICAL )
        requestedCols = { ...
            app.NoInundation_Edit.Value, ...
            app.DepthLess_Edit.Value, ...
            app.DepthMore_Edit.Value };

        tblVars = recTable.Properties.VariableNames;
        matchedCols = cell(1, numel(requestedCols));

        for i = 1:numel(requestedCols)

            req = strtrim(string(requestedCols{i}));
            idx = find(strcmpi(req, tblVars), 1);

            if isempty(idx)
                error('Recovery column "%s" not found.', req);
            end

            matchedCols{i} = tblVars{idx};
        end

        inputs.tables.RecoveryCols = matchedCols;
    end

    %% -------------------------------
    %%  DEPTH + LABELS
    %% -------------------------------
    inputs.Depth_Ranges = app.Depth_Ranges;
    inputs.depthLabel   = app.Depth_Edit.Value;

    %% -------------------------------
    %%  OUTPUT
    %% -------------------------------
    inputs.outputFolder = app.FullDirectory;

    %% -------------------------------
    %%  DAMAGE STATES
    %% -------------------------------
    inputs.damageStates = {'minor','moderate','major','destroyed'};
     inputs.filenames    = {'minor','moderate','major','destroyed'};

    %% -------------------------------
    %%  THRESHOLD
    %% -------------------------------
    inputs.threshold = app.ProbabilityThreshold.Value;


end