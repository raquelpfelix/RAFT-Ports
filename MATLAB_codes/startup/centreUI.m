% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.


function centreUI(app)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  POSITION UI AT CENTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

screenSize = get(0, 'ScreenSize');

appW = 379;
appH = 477;

app.RAFTPortsUIFigure.Position = [ ...
    (screenSize(3) - appW)/2, ...
    (screenSize(4) - appH)/2, ...
    appW, appH ...
];

end