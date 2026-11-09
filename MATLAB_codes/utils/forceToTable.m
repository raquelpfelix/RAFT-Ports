% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function T = forceToTable(data, colNames)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FORCE INPUT DATA INTO VALID MATLAB TABLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  CASE 1 — Already a table
if istable(data)
    T = data;
    return;
end

%%  CASE 2 — Struct input
if isstruct(data)

    % Ensure proper shape (column or row struct only)
    if size(data,1) > 1 && size(data,2) > 1
        data = data(:);   %  force column vector
    end

    T = struct2table(data);
    return;
end

%%  CASE 3 — Numeric input
if isnumeric(data)
    data = num2cell(data);
end

%%  CASE 4 — Cell input
if iscell(data)

    if nargin < 2 || isempty(colNames)
        error('Column names required for cell input.');
    end

    T = cell2table(data, 'VariableNames', cellstr(colNames));
    return;
end

%%  OTHERWISE → ERROR
error('Unsupported data type for conversion to table.');

end