% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function PolyData = assignStructuralDamageProbabilities( ...
    PolyData, sdsTables, filenames, uniqueTypes, outputFolder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASSIGN STRUCTURAL DAMAGE PROBABILITIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ===========================================================
%% LOOP THROUGH SDS TABLES (SDS1 → SDS4)
%% ===========================================================
for k = 1:4

    UItable = sdsTables{k};

    %% =======================================================
    %% STEP 1 — FORCE VALID TABLE
    %% =======================================================
    RefTable = UItable.Data;

    if isstruct(RefTable)

        if size(RefTable,1) > 1 && size(RefTable,2) > 1
            RefTable = RefTable(:);
        end

        RefTable = struct2table(RefTable);

    end

    if ~istable(RefTable)

        RefTable = cell2table( ...
            num2cell(RefTable), ...
            'VariableNames', cellstr(UItable.ColumnName));

    end

    RefTable.Properties.VariableNames = ...
        matlab.lang.makeValidName(string(UItable.ColumnName));

    tableVars = string(RefTable.Properties.VariableNames);

    %% =======================================================
    %% STEP 2 — SAVE REFERENCE TABLE
    %% =======================================================
    if ~isempty(outputFolder)

        if ~exist(outputFolder,'dir')
            mkdir(outputFolder);
        end

        fileName = fullfile( ...
            outputFolder, ...
            sprintf('ReferenceTable_StructuralDamage_%s.csv', ...
            filenames{k}));

        writetable(RefTable,fileName);

    end

    %% =======================================================
    %% STEP 3 — LOOP THROUGH TYPES
    %% =======================================================
    for t = 1:length(uniqueTypes)

        currentType = string(uniqueTypes{t});

        idx = find(strcmpi(tableVars,currentType),1);

        if isempty(idx)
            continue;
        end

        varName = tableVars(idx);

        colData = RefTable.(varName);

        %% ===================================================
        %% ROBUST NUMERIC CONVERSION
        %% ===================================================
        if iscell(colData)

            colData = str2double(string(colData));

        elseif isstring(colData) || ischar(colData)

            colData = str2double(colData);

        else

            colData = double(colData);

        end

        colData(~isfinite(colData)) = NaN;

%% ===================================================
%% STEP 4 — ASSIGN TO POLYDATA
%% ===================================================
for i = 1:numel(PolyData)

    if ~isfield(PolyData(i),'type') || ...
            ~strcmpi(string(PolyData(i).type), currentType)
        continue;
    end

    if ~isfield(PolyData(i),'DepthGroup')
        continue;
    end

    d = PolyData(i).DepthGroup;

    % Depth = 0 → Probability = 0
    if isnumeric(d) && isfinite(d) && d == 0

        PolyData(i).(sprintf('%s_StructDamage', ...
            filenames{k})) = 0;

        continue;

    end

    % Skip invalid values
    if isempty(d) || ~isfinite(d)
        continue;
    end

    %% ===================================================
    %% Convert DepthGroup to SDS table row
    %%
    %% Row  1 = 0.5 m
    %% Row  2 = 1.0 m
    %% Row  3 = 1.5 m
    %% ...
    %% Row 20 = 10.0 m
    %% ===================================================

    rowIndex = round(d * 2);

    % Prevent exceeding table limits
    rowIndex = min(rowIndex, height(RefTable));

    if rowIndex >= 1 && rowIndex <= numel(colData)

        PolyData(i).(sprintf('%s_StructDamage', ...
            filenames{k})) = colData(rowIndex);

    else

        PolyData(i).(sprintf('%s_StructDamage', ...
            filenames{k})) = NaN;

    end

end
end
     

    end
end