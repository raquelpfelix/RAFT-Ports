% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function drawLandPolygons(ax, LandPolyData, LandPolygonColour)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  DRAW LAND POLYGONS (REUSABLE FOR ALL MAPS )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if isempty(LandPolyData) || ~isfield(LandPolyData, 'X')
    return;
end

S = LandPolyData;

for k = 1:length(S)

    if ~isfield(S(k), 'Geometry') || ...
       ~strcmpi(S(k).Geometry, 'Polygon')
        continue;
    end

    x = S(k).X;
    y = S(k).Y;

    %  unwrap cells
    if iscell(x), x = x{1}; end
    if iscell(y), y = y{1}; end

    %  skip invalid
    if isempty(x) || isempty(y) || ...
       all(isnan(x)) || all(isnan(y))
        continue;
    end

    %  safe polygon creation
    try
        LandPoly = polyshape(x, y);
    catch
        continue;
    end

    %  plot
    plot(ax, LandPoly, ...
        'FaceColor', LandPolygonColour, ...
        'EdgeColor', 'k', ...
        'FaceAlpha', 0.95);

end

end