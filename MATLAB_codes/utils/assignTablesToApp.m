% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = assignTablesToApp(app, tables)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  ASSIGN TABLES TO APP + ATTACH VALIDATORS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%  SDS TABLES
    app.Table_MinorSDS.Data       = tables.SDS1;
    app.Table_ModerateSDS.Data    = tables.SDS2;
    app.Table_MajorSDS.Data       = tables.SDS3;
    app.Table_DestroyedSDS.Data   = tables.SDS4;

    %%  LOSS TABLE
    app.Table_LossRatio.Data      = tables.Loss;

    %%  RECOVERY TABLE
    app.Table_RecoveryPotential.Data = tables.Recovery;

    %%   CRITICAL: ATTACH VALIDATORS AFTER DATA ASSIGNMENT
    app.attachTableValidators();

end