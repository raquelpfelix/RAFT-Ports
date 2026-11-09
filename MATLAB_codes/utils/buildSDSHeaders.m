% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function validNames = buildSDSHeaders(depthVal, cargo, chemical, construction, food, manufacturing, petrochemical, energy, warehouse)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  BUILD SDS TABLE HEADERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vals = [ ...
    string(depthVal), ...
    string(cargo), ...
    string(chemical), ...
    string(construction), ...
    string(food), ...
    string(manufacturing), ...
    string(petrochemical), ...
    string(energy), ...
    string(warehouse)];

%  Clean + enforce valid names
vals = strtrim(vals);

validNames = matlab.lang.makeValidName( ...
    vals, 'ReplacementStyle','underscore');

end
