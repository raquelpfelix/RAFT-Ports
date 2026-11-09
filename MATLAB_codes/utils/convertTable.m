% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function domTable = convertTable(T)

import mlreportgen.dom.*

data = [T.Properties.VariableNames; table2cell(T)];
data = string(data);

domTable = Table(data);
domTable.Border = 'solid';

end