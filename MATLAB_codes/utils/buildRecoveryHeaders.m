% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function validNames = buildRecoveryHeaders(monthsVal, noInundVal, depthLessVal, depthMoreVal)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  BUILD RECOVERY TABLE HEADERS + VALIDATE NAMES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Convert safely to string
monthsVal    = strtrim(string(monthsVal));
noInundVal   = strtrim(string(noInundVal));
depthLessVal = strtrim(string(depthLessVal));
depthMoreVal = strtrim(string(depthMoreVal));

%  FIX: use STRING ARRAY (NOT cell array)
header_recovery = [ ...
    monthsVal, ...
    noInundVal, ...
    depthLessVal, ...
    depthMoreVal ];

%  VALID NAMES
validNames = matlab.lang.makeValidName( ...
    header_recovery, 'ReplacementStyle','underscore');

end