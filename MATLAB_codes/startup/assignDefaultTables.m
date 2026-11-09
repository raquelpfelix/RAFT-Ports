% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = assignDefaultTables(app, T_SDS1, T_SDS2, T_SDS3, T_SDS4, T_Loss, T_Recovery)
% ===========================================================
% assignDefaultTables
% -----------------------------------------------------------
% This function assigns default reference tables to the UI tables
% in the App Designer interface.
%
% It also ensures that:
%   1. The data is correctly assigned
%   2. Column headers match the table variable names
%
%  Designed for:
%   - App Designer apps
%   - Standalone compiled applications (MATLAB Compiler safe)
%
%  Inputs:
%   app         -> App Designer app object
%   T_SDS1-4    -> Structural Damage State tables
%   T_Loss      -> Loss Ratio table
%   T_Recovery  -> Recovery Potential table
%
%  Output:
%   app         -> Updated app object
% ===========================================================

    %% ===========================================================
    %%  Helper function to safely assign table + headers
    %% ===========================================================
    function assignTable(uiTable, T)
        % This helper ensures:
        % - Only valid tables are assigned
        % - Headers are always synchronized
        % - Prevents crashes in standalone apps

        if istable(T) && ~isempty(T)
            %  Assign table data
            uiTable.Data = T;

            %  Assign column headers from table variable names
            uiTable.ColumnName = T.Properties.VariableNames;

        else
            % ⚠️ Fallback: assign empty table if input is invalid
            uiTable.Data = table();
            uiTable.ColumnName = {};
        end
    end


    %% ===========================================================
    %%  Assign all UI tables
    %% ===========================================================

    assignTable(app.Table_MinorSDS, T_SDS1);
    assignTable(app.Table_ModerateSDS, T_SDS2);
    assignTable(app.Table_MajorSDS, T_SDS3);
    assignTable(app.Table_DestroyedSDS, T_SDS4);
    assignTable(app.Table_RecoveryPotential, T_Recovery);
    assignTable(app.Table_LossRatio, T_Loss);

end