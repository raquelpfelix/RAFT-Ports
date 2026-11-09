% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function applyMapFormatting(ax, FigureTextSize, FigureWidth, app)

% ------------------------------------------------------------
% Ensure valid axes
% ------------------------------------------------------------
if ~isgraphics(ax,'axes')
    return;
end

% ------------------------------------------------------------
% Validate East/West limits
% ------------------------------------------------------------
eastValue = app.EastEditField.Value;
westValue = app.WestEditField.Value;

if eastValue < westValue

    % Swap if entered backwards
    Min_longitude = eastValue;
    Max_longitude = westValue;

    app.EastEditField.Value = Max_longitude;
    app.WestEditField.Value = Min_longitude;

elseif eastValue == westValue

    % Reset to TIFF limits if identical
    app.EastEditField.Value = app.TIFFeast;
    app.WestEditField.Value = app.TIFFwest;

end

% ------------------------------------------------------------
% Validate North/South limits
% ------------------------------------------------------------
northValue = app.NorthEditField.Value;
southValue = app.SouthEditField.Value;

if northValue < southValue

    % Swap if entered backwards
    Min_latitude = northValue;
    Max_latitude = southValue;

    app.NorthEditField.Value = Max_latitude;
    app.SouthEditField.Value = Min_latitude;

elseif northValue == southValue

    % Reset to TIFF limits if identical
    app.NorthEditField.Value = app.TIFFnorth;
    app.SouthEditField.Value = app.TIFFsouth;

end

% ------------------------------------------------------------
% Apply map limits
% ------------------------------------------------------------
xlim(ax, [app.WestEditField.Value, app.EastEditField.Value]);
ylim(ax, [app.SouthEditField.Value, app.NorthEditField.Value]);

% ------------------------------------------------------------
% Get ticks
% ------------------------------------------------------------
xAllTicks = xticks(ax);
yAllTicks = yticks(ax);

% Remove NaNs
xAllTicks = xAllTicks(~isnan(xAllTicks));
yAllTicks = yAllTicks(~isnan(yAllTicks));

% ------------------------------------------------------------
% Select only 2 ticks per axis
% ------------------------------------------------------------
if numel(xAllTicks) >= 4
    xtSel = sort([xAllTicks(2), xAllTicks(end-1)]);
elseif numel(xAllTicks) >= 2
    xtSel = sort([xAllTicks(1), xAllTicks(end)]);
else
    xtSel = xAllTicks;
end

if numel(yAllTicks) >= 4
    ytSel = sort([yAllTicks(2), yAllTicks(end-1)]);
elseif numel(yAllTicks) >= 2
    ytSel = sort([yAllTicks(1), yAllTicks(end)]);
else
    ytSel = yAllTicks;
end

xticks(ax, xtSel);
yticks(ax, ytSel);

% ------------------------------------------------------------
% Format degree labels
% ------------------------------------------------------------
xticklabels(ax, arrayfun(@(x) ...
    sprintf('%.3f°%s', abs(x), ...
    char('E'*(x>=0) + 'W'*(x<0))), ...
    xtSel, 'UniformOutput', false));

yticklabels(ax, arrayfun(@(y) ...
    sprintf('%.3f°%s', abs(y), ...
    char('N'*(y>=0) + 'S'*(y<0))), ...
    ytSel, 'UniformOutput', false));

ytickangle(ax, 90);

% ------------------------------------------------------------
% Font settings
% ------------------------------------------------------------
ax.XAxis.FontSize = FigureTextSize - 2;
ax.YAxis.FontSize = FigureTextSize - 2;

% ------------------------------------------------------------
% Axis appearance
% ------------------------------------------------------------
set(ax, 'Layer','top', 'LineWidth',1);
box(ax,'on');

% ------------------------------------------------------------
% Resize figure based on map extent
% ------------------------------------------------------------
xRange = diff(xlim(ax));
yRange = diff(ylim(ax));

midLat = mean(ylim(ax));

aspectRatio = yRange / (xRange * cosd(midLat));

fig = ancestor(ax,'figure');

newWidth  = FigureWidth;
newHeight = newWidth * aspectRatio;

set(fig, ...
    'Units','centimeters', ...
    'Position',[10 5 newWidth newHeight]);

end