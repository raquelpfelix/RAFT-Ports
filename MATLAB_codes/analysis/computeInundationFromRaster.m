% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function PolyData = computeInundationFromRaster(PolyData, Z, R)

%% ===========================================================
%%  STEP 0 — BASIC VALIDATION
%% Ensure inputs exist
%% ===========================================================
if isempty(PolyData) || isempty(Z) || isempty(R)
    return;
end

%% ===========================================================
%%  STEP 1 — SETUP GRID SIZE AND TYPE
%% Prepare raster dimensions and coordinate system
%% ===========================================================
[numRows, numCols] = size(Z);

% Check if raster uses geographic coordinates
isGeo = isa(R,'map.rasterref.GeographicCellsReference');

%% ===========================================================
%%  STEP 2 — LOOP THROUGH EACH POLYGON
%% Compute inundation value per polygon
%% ===========================================================
N = numel(PolyData);

for k = 1:N

    %%  Extract polygon coordinates
    X = PolyData(k).X;
    Y = PolyData(k).Y;

    % Handle cell format safely
    if iscell(X), X = X{1}; end
    if iscell(Y), Y = Y{1}; end

    % Skip invalid polygons
    if isempty(X) || isempty(Y) || ~any(isfinite(X)) || ~any(isfinite(Y))
        PolyData(k).Inundation = NaN;
        continue;
    end

    %% =======================================================
    %%  STEP 2.1 — CONVERT TO INTRINSIC COORDINATES
    %% This aligns polygon with raster grid
    %% =======================================================
    if isGeo
        [xIntr, yIntr] = geographicToIntrinsic(R, Y, X);
    else
        [xIntr, yIntr] = worldToIntrinsic(R, X, Y);
    end

    % Keep only valid points
    valid = isfinite(xIntr) & isfinite(yIntr);
    xIntr = xIntr(valid);
    yIntr = yIntr(valid);

    % Skip if not enough points to form polygon
    if numel(xIntr) < 2
        PolyData(k).Inundation = NaN;
        continue;
    end

    %% =======================================================
    %%  STEP 2.2 — CREATE POLYSHAPE
    %% More robust than simple inpolygon
    %% =======================================================
    pgon = polyshape(xIntr, yIntr, 'Simplify', false);

    if isempty(pgon.Vertices)
        PolyData(k).Inundation = NaN;
        continue;
    end

    %% =======================================================
    %%  STEP 2.3 — COMPUTE TIGHT BOUNDING BOX
    %% Restrict raster processing for speed and accuracy
    %% =======================================================
    cMin = max(1, floor(min(xIntr)));
    cMax = min(numCols, ceil(max(xIntr)));

    rMin = max(1, floor(min(yIntr)));
    rMax = min(numRows, ceil(max(yIntr)));

    if cMin > cMax || rMin > rMax
        PolyData(k).Inundation = NaN;
        continue;
    end

    %% =======================================================
    %%  STEP 2.4 — BUILD LOCAL GRID (SUBSET ONLY)
    %% Avoid computing over full raster
    %% =======================================================
    [C, Rr] = meshgrid(cMin:cMax, rMin:rMax);

    % Determine points inside polygon
    insideVec = isinterior(pgon, C(:), Rr(:));
    insideMask = reshape(insideVec, size(C));

    %% =======================================================
    %%  STEP 2.5 — EXTRACT RASTER VALUES
    %% Get inundation values inside polygon
    %% =======================================================
    subZ = Z(rMin:rMax, cMin:cMax);

    vals = subZ(insideMask);
    vals = vals(isfinite(vals));   % remove NaNs

    %% =======================================================
    %%  STEP 2.6 — COMPUTE FINAL STATISTIC
    %% Choose how to represent inundation
    %% =======================================================
    if isempty(vals)
        PolyData(k).Inundation = 0;
    else
        % Use MAX (consistent with your old system default)
        PolyData(k).Inundation = max(vals);
        % Alternative options:
        % mean(vals) or min(vals)
    end

end



end