% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = initialiseGlobalSettings(app)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  CORE DEPTH SETTINGS (USED EVERYWHERE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

app.NumDepthBins = 10;

% Depth ranges must match your bin system (0–1, 1–2, ...)
app.Depth_Ranges = categorical({ ...
    '(0 - 1]'; '(1 - 2]'; '(2 - 3]'; ...
    '(3 - 4]'; '(4 - 5]'; '(5 - 6]'; ...
    '(6 - 7]'; '(7 - 8]'; '(8 - 9]'; ...
    '(9 - 10]'});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  COLOR SETTINGS (USED IN PLOTS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pastelColors0 = [
    235, 225, 150;
    240, 110, 70;
    150, 25, 25;
    120, 0, 110
] / 255;

app.pastelColors = pastelColors0 * 0.95;
end