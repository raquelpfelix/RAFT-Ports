% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function [loopItems, loopItemsDisplay, mode, stateMap] = setupMapMode(mapType)

stateMap = {};

switch mapType

    case 'Inundation'
        loopItems = {'Inundation'};
        loopItemsDisplay = {'Structures Affected by Inundation'};
        mode = 'simple';

    case 'LossRatio'
        loopItems = {'LossRatio'};
        loopItemsDisplay = {'Loss Ratio (Repair / Replacement)'};
        mode = 'simple';

    case 'Damage'
        loopItems = {'minor','moderate','major','destroyed'};
        loopItemsDisplay = {'Minor Structural Damage','Moderate Structural Damage','Major Structural Damage','Complete Structural Destruction'};
        stateMap = {'Structural_Minor_Damage','Structural_Moderate_Damage','Structural_Major_Damage','Structural_Complete_Destruction'};
        mode = 'damage';

    case 'Recovery'

        nMonths = 20;

        loopItems = cell(1,nMonths);
        monthTitle = cell(1,nMonths);

        for m = 1:nMonths

            startMonth = (m-1)*0.5;
            endMonth   = m*0.5;

            startStr = strrep(num2str(startMonth,'%g'),'.','p');
            endStr   = strrep(num2str(endMonth,'%g'),'.','p');

            loopItems{m} = sprintf( ...
                'RecoveryPotential_%sto%smos', ...
                startStr, ...
                endStr);

            monthTitle{m} = { ...
                'Structures with a probability of', ...
                'recovery exceeding the threshold', ...
                sprintf('within %.1f to ≤%.1f months', ...
                startMonth, endMonth) ...
                };
        end

        loopItemsDisplay = monthTitle;
        mode = 'recovery';
end

end
