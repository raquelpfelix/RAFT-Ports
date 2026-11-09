% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = assignDepthGroups(app)

PD = app.PolyData;

if isempty(PD)
    return;
end

for i = 1:numel(PD)

    % Round inundation depth to 3 decimal place
    d = round(PD(i).Inundation,1);

    if isnan(d) || d == 0
        PD(i).DepthGroup = 0;
    else
        %Assigns a DepthGroup that is equivalent to the max of the given range
        %The interval used is 0.5
        %Examples: 0.5 < d ≤ 1.0 → 1.0; 9.5 < d ≤ 10.0 → 10.0
        PD(i).DepthGroup = min(10, ceil(d*2)/2);
    end
end

app.PolyData = PD;
end
