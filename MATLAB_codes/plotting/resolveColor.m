% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function c = resolveColor(val)

    if ischar(val) || isstring(val)

        val = strtrim(string(val));

        %  Case 1: short color (e.g. 'k')
        if strlength(val) == 1
            c = char(val);
            return;
        end

        %  Case 2: RGB string "[x x x]"
        if startsWith(val,"[") && endsWith(val,"]")
            tmp = str2num(val); %#ok<ST2NM>
            if numel(tmp) == 3
                c = tmp;
                return;
            end
        end

        %  fallback
        tmp = str2num(val); %#ok<ST2NM>
        if ~isempty(tmp)
            c = tmp;
        else
            c = char(val);
        end

    else
        % already numeric
        c = val;
    end

end