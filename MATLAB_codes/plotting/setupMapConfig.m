% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function config = setupMapConfig(app)

config.FigureTextSize = 10;
config.FigureWidth = 12;
config.Resolution = app.FigureResolutiondpiEditField.Value;

config.thr = app.ProbabilityThreshold.Value;

config.rasterData = double(app.InundationData);
config.rasterData(config.rasterData <= 0) = NaN;

config.R = app.InundationGeoRef;
config.xLimits = config.R.LongitudeLimits;
config.yLimits = config.R.LatitudeLimits;


polyColorMap = containers.Map( ...
    {'black','grey 1','grey 2','grey 3','grey 4','grey 5', ...
    'white 1','white 2','white 3','white 4','white 5','green','yellow','cyan','magenta', ...
    'red 1','red 2','red 3','red 4','red 5','blue 1','blue 2','blue 3','blue 4','blue 5'}, ...
    {'k','[0.20 0.20 0.20]','[0.40 0.40 0.40]','[0.60 0.60 0.60]', ...
    '[0.80 0.80 0.80]','[0.90 0.90 0.90]', ...
    '[1 1 1]','[0.97 0.97 0.97]','[0.94 0.94 0.94]', ...
    '[0.91 0.91 0.91]','[0.88 0.88 0.88]', ...
    'g','y','c','m', ...
    '[1 0.8 0.8]','[1 0.6 0.6]','[1 0.4 0.4]', ...
    '[0.85 0.2 0.2]','[0.6 0 0]', ...
    '[0.8 0.88 1]','[0.6 0.75 1]','[0.4 0.6 1]', ...
    '[0.2 0.4 0.85]','[0.05 0.2 0.6]'});

config.PolygonFaceColour = ...
    resolveColor(polyColorMap(app.PolygonColorDropdown.Value));

config.PolygonBelowThresholdColour = ...
    resolveColor(polyColorMap(app.Unaffected_PolygonColorDropdown.Value));

config.LandPolygonColour = ...
    resolveColor(polyColorMap(app.LandColourDropDown.Value));


config.colormap = getInundationColormap(app);

cmin = app.Colorbar_Min.Value;
cmax = app.Colorbar_Max.Value;


% if isempty(cmin) || isempty(cmax) || cmin >= cmax
%     cmax = max(config.rasterData(:),[],'omitnan');
%      app.Colorbar_Min.Value = 0;
%  app.Colorbar_Max.Value = cmax;
% end

config.clim = [cmin cmax];

end