% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = setupHeaderCallbacks(app)

    fields = { ...
        app.NoInundation_Edit, ...
        app.DepthLess_Edit, ...
        app.DepthMore_Edit ...
    };

    nFields = numel(fields);
    app.DefaultHeaderValues = cell(nFields,1);

    for i = 1:nFields

        fieldObj = fields{i};

        if isempty(fieldObj)
            continue;
        end

        %  Store default value
        if isprop(fieldObj,'Value')
            app.DefaultHeaderValues{i} = fieldObj.Value;
        else
            app.DefaultHeaderValues{i} = [];
        end

%         %  Assign validation callback
%         if isprop(fieldObj,'ValueChangedFcn')
%             fieldObj.ValueChangedFcn = @(src,event) ...
%                 app.AnyHeaderValidation(src, event);   %  FIXED
%         end
    end

end
