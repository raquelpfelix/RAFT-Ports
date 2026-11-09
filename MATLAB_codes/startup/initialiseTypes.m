% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.


function [typesMaster, TypeLegendColors] = initialiseTypes(app)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  INITIALISE TYPE SYSTEM (CLEAN + CONSISTENT )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    fields = {
        app.cargo_Edit.Value
        app.warehouse_Edit.Value
        app.chemical_Edit.Value
        app.construction_Edit.Value
        app.energy_Edit.Value
        app.food_Edit.Value
        app.manufacturing_Edit.Value
        app.petrochemical_Edit.Value
    };

    colors = [
        0.2 0.6 0.8;
        0.6 0.6 0.6;
        0.8 0.2 0.2;
        0.9 0.7 0.2;
        0.3 0.8 0.3;
        0.9 0.5 0.1;
        0.3 0.3 0.8;
        0.7 0.2 0.7
    ];

    %  Initialise outputs ONLY
    typesMaster = {};
    TypeLegendColors = containers.Map('KeyType','char','ValueType','any');

    %%  BUILD TYPES
    idx = 0;

    for i = 1:numel(fields)

        key = strtrim(string(fields{i}));

        if strlength(key) == 0
            continue;
        end

        idx = idx + 1;

        keyChar = char(key);   %  enforce char keys

        typesMaster{idx} = keyChar;

        TypeLegendColors(keyChar) = colors(i,:);

    end

    %%  SAFETY
    if isempty(typesMaster)
        typesMaster = {'Undefined'};
        TypeLegendColors('Undefined') = [0.5 0.5 0.5];
    end

end