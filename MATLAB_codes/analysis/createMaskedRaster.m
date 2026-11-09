% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = createMaskedRaster(app)
    PD = app.PolyData;
    if isempty(PD) || isempty(app.InundationData)
        return;
    end
    [numRows,numCols] = size(app.InundationData);
    isGeo = isa(app.InundationGeoRef, ...
        'map.rasterref.GeographicCellsReference');
    valueType = string(app.ExtractDepthDropDown.Value);
    [C_full,R_full] = meshgrid(1:numCols,1:numRows);
    C_vec = C_full(:);
    R_vec = R_full(:);
    fullMask = false(numRows,numCols);
    for k = 1:numel(PD)
        X = PD(k).X;
        Y = PD(k).Y;
        if iscell(X)
            X = X{1};
        end
        if iscell(Y)
            Y = Y{1};
        end
        if isempty(X) || isempty(Y) || ...
                ~any(isfinite(X)) || ~any(isfinite(Y))
            PD(k).Inundation = NaN;
            continue;
        end
        % -----------------------------------------------------
        % Convert to intrinsic coordinates
        % -----------------------------------------------------
        if isGeo
            [xIntr,yIntr] = geographicToIntrinsic( ...
                app.InundationGeoRef,Y,X);
        else
            [xIntr,yIntr] = worldToIntrinsic( ...
                app.InundationGeoRef,X,Y);
        end
        valid = isfinite(xIntr) & isfinite(yIntr);
        xIntr = xIntr(valid);
        yIntr = yIntr(valid);
        if numel(xIntr) < 3
            PD(k).Inundation = NaN;
            continue;
        end
        % -----------------------------------------------------
        % Polygon mask
        % Centre inside OR at least 2 corners inside
        % -----------------------------------------------------
        inside0 = inpolygon( ...
            C_vec, ...
            R_vec, ...
            xIntr, ...
            yIntr);
        inside1 = inpolygon( ...
            C_vec-0.5, ...
            R_vec-0.5, ...
            xIntr, ...
            yIntr);
        inside2 = inpolygon( ...
            C_vec+0.5, ...
            R_vec-0.5, ...
            xIntr, ...
            yIntr);
        inside3 = inpolygon( ...
            C_vec-0.5, ...
            R_vec+0.5, ...
            xIntr, ...
            yIntr);
        inside4 = inpolygon( ...
            C_vec+0.5, ...
            R_vec+0.5, ...
            xIntr, ...
            yIntr);
        insideCount = ...
            double(inside1) + ...
            double(inside2) + ...
            double(inside3) + ...
            double(inside4);
        inside = inside0 | (insideCount >= 3);
        polyMask = reshape(inside,numRows,numCols);
        % -----------------------------------------------------
        % Extract inundation values
        % -----------------------------------------------------
        vals = app.InundationData(polyMask);
        vals = vals(isfinite(vals));
        if isempty(vals)
            PD(k).Inundation = 0;
        else
            switch valueType
                case "Minimum"
                    PD(k).Inundation = min(vals);
                case "Mean"
                    PD(k).Inundation = mean(vals);
                otherwise
                    PD(k).Inundation = max(vals);
            end
        end

        %Set negative depths to zero
        if vals <0
            vals = 0;
        end
        % -----------------------------------------------------
        % Accumulate overall mask
        % -----------------------------------------------------
        fullMask = fullMask | polyMask;
    end
    % ---------------------------------------------------------
    % Save updated PolyData
    % ---------------------------------------------------------
    app.PolyData = PD;
    % ---------------------------------------------------------
    % Create masked raster
    % ---------------------------------------------------------
    maskedRaster = single(app.InundationData);
    maskedRaster(~fullMask) = NaN;
    outputPath = fullfile( ...
        app.FullDirectory, ...
        'Inundation_BuildingMasked.tif');
    geotiffwrite( ...
        outputPath, ...
        maskedRaster, ...
        app.InundationGeoRef);
end