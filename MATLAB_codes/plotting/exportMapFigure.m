% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function exportMapFigure(fig, app, mode, loopItems, stateMap, i, config)

if strcmp(mode,'damage')

    filename = fullfile(app.FullDirectory, ...
        ['Map_', stateMap{i}, '.png']);

elseif strcmp(mode,'recovery')

    filename = fullfile(app.FullDirectory, ...
        ['Map_', loopItems{i}, '.png']);

else

    filename = fullfile(app.FullDirectory, ...
        ['Map_', loopItems{i}, '.png']);
end

exportgraphics(fig, filename, ...
    'Resolution', config.Resolution);

end