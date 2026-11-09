% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = assignResults(app, results)

    app.InundationCount = results.InundationCount;

    app.Summary_ProbExc = results.Summary_ProbExc;
    app.Summary_ProbExc_Table = results.SDS_Summary;

    app.Summary_LossRatio = results.Summary_LossRatio;
    app.Detailed_LossRatio_Table = results.Detailed_LossRatio_Table;

    app.Detailed_Recovery = results.Recovery_Detailed;  
    app.Summary_RecoveryPotential = results.Summary_RecoveryPotential;

    app.ReferenceTable = results;
    app.PolyData       = results.PolyData;

end