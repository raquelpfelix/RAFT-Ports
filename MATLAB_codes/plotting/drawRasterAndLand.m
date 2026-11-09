% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function drawRasterAndLand(ax, app, config)

%%  LAND
drawLandPolygons(ax, app.LandPolyData, config.LandPolygonColour);
%%  RASTER PREP
rasterPlot = config.rasterData;

%  IMPORTANT: match original behaviour
if strcmp(config.R.RasterInterpretation,'cells') && ...
   strcmp(config.R.ColumnsStartFrom,'north')

    rasterPlot = flipud(rasterPlot);

end

%%  DRAW RASTER
imagesc(ax, ...
    'XData', config.xLimits, ...
    'YData', config.yLimits, ...
    'CData', rasterPlot, ...
    'AlphaData', ~isnan(rasterPlot));

set(ax,'YDir','normal');

%%  COLORMAP
colormap(ax, config.colormap);
clim(ax, config.clim);

%%  COLORBAR
cb = colorbar(ax,'eastoutside');
cb.Label.String = 'Depth (m)';
cb.FontSize = 8;

end