% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function [legendHandles, legendLabels] = ...
    plotStructures(ax, data, mode, field, config, mapType)

legendHandles = gobjects(1,0);
legendLabels = {};

thr = config.thr;

%  Expected legend entries
expectedLabels = { ...
    sprintf('≥ %.2f',thr), ...
    sprintf('< %.2f',thr)};

for k = 1:numel(data)

    x = data(k).X;
    if iscell(x), x = x{1}; end

    y = data(k).Y;
    if iscell(y), y = y{1}; end

    if isempty(x) || isempty(y)
        continue;
    end

    fc = config.PolygonBelowThresholdColour;
    label = '';

    switch mode

        %%  SIMPLE MODES
        case 'simple'

            if strcmp(mapType,'Inundation')

                if isfield(data(k),'DepthGroup') && ...
                        ~isempty(data(k).DepthGroup) && ...
                        data(k).DepthGroup ~= 0

                    fc = config.PolygonFaceColour;
                    label = 'Inundated';

                end

            elseif strcmp(mapType,'LossRatio')

                v = NaN;

                if isfield(data(k),'LossRatio')
                    v = data(k).LossRatio;
                end

                if iscell(v)
                    if ~isempty(v)
                        v = v{1};
                    else
                        v = NaN;
                    end
                end

                if isstring(v) || ischar(v)
                    v = str2double(v);
                end

                if isnumeric(v) && isscalar(v) && ...
                        isfinite(v) && v >= thr

                    fc = config.PolygonFaceColour;
                    label = sprintf('≥ %.2f',thr);

                else

                    fc = config.PolygonBelowThresholdColour;
                    label = sprintf('< %.2f',thr);

                end

            end

        %%  DAMAGE
        case 'damage'

            fld = [field '_StructDamage'];

            v = NaN;

            if isfield(data(k),fld)
                v = data(k).(fld);
            end

            if iscell(v)
                if ~isempty(v)
                    v = v{1};
                else
                    v = NaN;
                end
            end

            if isstring(v) || ischar(v)
                v = str2double(v);
            end

            if isnumeric(v) && isscalar(v) && ...
                    isfinite(v) && v >= thr

                fc = config.PolygonFaceColour;
                label = sprintf('≥ %.2f',thr);

            else

                fc = config.PolygonBelowThresholdColour;
                label = sprintf('< %.2f',thr);

            end

        %%  RECOVERY
        case 'recovery'

            v = NaN;

            if isfield(data(k),field)
                v = data(k).(field);
            end

            if iscell(v)
                if ~isempty(v)
                    v = v{1};
                else
                    v = NaN;
                end
            end

            if isstring(v) || ischar(v)
                v = str2double(v);
            end

            if isnumeric(v) && isscalar(v) && ...
                    isfinite(v) && v >= thr

                fc = config.PolygonFaceColour;
                label = sprintf('≥ %.2f',thr);

            else

                fc = config.PolygonBelowThresholdColour;
                label = sprintf('< %.2f',thr);

            end

    end

    %%  DRAW POLYGON
    plot(ax, polyshape(x,y), ...
        'FaceColor',fc, ...
        'EdgeColor','k');

    %%  UNIQUE LEGEND
    if ~isempty(label) && ~any(strcmp(legendLabels,label))

        legendHandles(end+1) = plot(ax,nan,nan,'s', ...
            'MarkerFaceColor',fc, ...
            'MarkerEdgeColor','k', ...
            'LineStyle','none');

        legendLabels{end+1} = label;

    end

end

%%  ENSURE BOTH LEGEND ENTRIES EXIST
if ~(strcmp(mode,'simple') && strcmp(mapType,'Inundation'))

    for j = 1:numel(expectedLabels)

        if ~any(strcmp(legendLabels,expectedLabels{j}))

            if startsWith(expectedLabels{j},'≥')
                fcTmp = config.PolygonFaceColour;
            else
                fcTmp = config.PolygonBelowThresholdColour;
            end

            legendHandles(end+1) = plot(ax,nan,nan,'s', ...
                'MarkerFaceColor',fcTmp, ...
                'MarkerEdgeColor','k', ...
                'LineStyle','none');

            legendLabels{end+1} = expectedLabels{j};

        end

    end

end

end