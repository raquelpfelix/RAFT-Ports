% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function app = setupOutputDirectory(app)

%  If user has NOT selected a folder → use Desktop
if isempty(app.WorkDirectoryUserSet) || ...
        ~isfolder(app.WorkDirectoryUserSet)

    %  Detect Desktop path (cross-platform)
    if ispc
        desktopPath = fullfile(getenv('USERPROFILE'),'Desktop');
    else
        desktopPath = fullfile(getenv('HOME'),'Desktop');
    end

    if isfolder(desktopPath)
        app.WorkDirectoryUserSet = desktopPath;
    else
        app.WorkDirectoryUserSet = pwd;
    end
    %  Create output folder
    folderName = 'OUTPUT_REPORT';

    app.FullDirectory = fullfile(app.WorkDirectoryUserSet, folderName);

    if ~isfolder(app.FullDirectory)
        mkdir(app.FullDirectory);
    end

else
    %Use user-selected directory
    app.FullDirectory = app.DirectoryEditField.Value;
end


end
