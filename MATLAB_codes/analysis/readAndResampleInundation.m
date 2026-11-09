% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = readAndResampleInundation(app)

    % ===========================================================
    % Check valid input
    % ===========================================================
    if strcmp(app.InundationFileEditField.Value,"0") || ...
            strcmp(app.InundationFileEditField.Value,"00")
        return;
    end

    % ===========================================================
    % Read GeoTIFF
    % ===========================================================
    if contains(app.InundationFullPath,'.tif')

        [A,R] = readgeoraster(app.InundationFullPath);

        % -------------------------------------------------------
        % Default = NO RESAMPLING
        % -------------------------------------------------------
        methodVal  = 'notdefined';
        doResample = false;

        try

            val = string(app.ResampleRasterDropDown.Value);

            switch lower(strtrim(val))

                case "no"
                    doResample = false;
                    methodVal  = 'notdefined';

                case "nearest"
                    doResample = true;
                    methodVal  = 'nearest';

                case "linear"
                    doResample = true;
                    methodVal  = 'linear';

                case "cubic"
                    doResample = true;
                    methodVal  = 'cubic';

                otherwise
                    doResample = false;
                    methodVal  = 'notdefined';

            end

        catch

            doResample = false;
            methodVal  = 'notdefined';

        end

        interpFactor = app.FactorEditField.Value;

        A0 = double(A);

        % =======================================================
        % Resample raster only when requested
        % =======================================================
        if doResample && interpFactor > 1

            [nR,nC] = size(A0);

            [c0,r0] = meshgrid(1:nC,1:nR);

            [c1,r1] = meshgrid( ...
                linspace(1,nC,nC*interpFactor), ...
                linspace(1,nR,nR*interpFactor));

            A_interp = interp2(c0,r0,A0,c1,r1,methodVal);

            % ---------------------------------------------------
            % Update referencing object
            % ---------------------------------------------------
            R_interp = R;
            R_interp.RasterSize = size(A_interp);

            if strcmp(R.CoordinateSystemType,'geographic')

                R_interp.CellExtentInLatitude = ...
                    R.CellExtentInLatitude/interpFactor;

                R_interp.CellExtentInLongitude = ...
                    R.CellExtentInLongitude/interpFactor;

            else

                R_interp.CellExtentInWorldX = ...
                    R.CellExtentInWorldX/interpFactor;

                R_interp.CellExtentInWorldY = ...
                    R.CellExtentInWorldY/interpFactor;

            end

            app.InundationData   = A_interp;
            app.InundationGeoRef = R_interp;

        else

            % ---------------------------------------------------
            % NO RESAMPLING
            % Use original raster exactly as uploaded
            % ---------------------------------------------------
            app.InundationData   = A0;
            app.InundationGeoRef = R;

        end


        % =======================================================
        % Store original resolution information
        % =======================================================
        if strcmp(R.CoordinateSystemType,'geographic')

            app.latResolution = sprintf('%.4e', ...
                R.CellExtentInLatitude);

            app.lonResolution = sprintf('%.4e', ...
                R.CellExtentInLongitude);

            if doResample && interpFactor > 1

                app.InterpLatResolution = sprintf('%.6e', ...
                    R_interp.CellExtentInLatitude);

                app.InterpLonResolution = sprintf('%.6e', ...
                    R_interp.CellExtentInLongitude);

            else

                app.InterpLatResolution = app.latResolution;
                app.InterpLonResolution = app.lonResolution;

            end

        elseif strcmp(R.CoordinateSystemType,'planar')

            app.lonResolution = sprintf('%.4e', ...
                R.CellExtentInWorldX);

            app.latResolution = sprintf('%.4e', ...
                R.CellExtentInWorldY);

            if doResample && interpFactor > 1

                app.InterpLatResolution = sprintf('%.4e', ...
                    R_interp.CellExtentInWorldX);

                app.InterpLonResolution = sprintf('%.4e', ...
                    R_interp.CellExtentInWorldY);

            else

                app.InterpLatResolution = app.lonResolution;
                app.InterpLonResolution = app.latResolution;

            end

        end

    end

end