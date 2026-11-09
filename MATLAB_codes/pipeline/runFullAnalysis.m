% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
% For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

function results = runFullAnalysis(inputs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FULL ANALYSIS PIPELINE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  STEP 0 — VALIDATION
if isempty(inputs.PolyData) || ~isstruct(inputs.PolyData)
    error('PolyData input is empty or invalid.');
end

PD = inputs.PolyData;

%%  STEP 1 — VERIFY INUNDATION EXISTS
if ~isfield(PD,'Inundation') || ~isfield(PD,'DepthGroup')
    error('Inundation or DepthGroup not assigned.');
end

%%  STEP 2 — INUNDATION COUNTS
[InundationCount, InundationSummary, ~, ~, uniqueTypes] = ...
    computeInundationCounts( ...
        PD, inputs.typesMaster, ...
        inputs.Depth_Ranges, ...
        inputs.depthLabel, ...
        inputs.outputFolder);

if isempty(uniqueTypes)
    error('No valid industry types found.');
end

% ===========================================================
%  KEEP ONLY TYPES PRESENT IN typesMaster
% ===========================================================
typesMasterLower = lower(string(inputs.typesMaster));
uniqueTypesLower = lower(string(uniqueTypes));

validMask = ismember(uniqueTypesLower, typesMasterLower);

if ~all(validMask)

    skippedTypes = uniqueTypes(~validMask);

    fprintf('\nWARNING: Skipping unknown industry types:\n');
    disp(skippedTypes);

    uniqueTypes = uniqueTypes(validMask);

end

if isempty(uniqueTypes)
    error('No valid industry types match inputs.typesMaster.');
end

%%  STEP 3 — FIX TYPES (ROBUST )

%  Ensure filenamesCell is always cell array of char
if iscell(inputs.filenames)
    filenamesCell = inputs.filenames;
elseif isstring(inputs.filenames)
    filenamesCell = cellstr(inputs.filenames);
elseif ischar(inputs.filenames)
    filenamesCell = {inputs.filenames};
else
    error('inputs.filenames must be cell, string, or char');
end

%  Ensure uniqueTypesCell is always cell array of char
if iscell(uniqueTypes)
    uniqueTypesCell = uniqueTypes;
elseif isstring(uniqueTypes)
    uniqueTypesCell = cellstr(uniqueTypes);
elseif ischar(uniqueTypes)
    uniqueTypesCell = {uniqueTypes};
else
    error('uniqueTypes must be cell, string, or char');
end


%%  STEP 4 — ASSIGN STRUCTURAL DAMAGE

PD = assignStructuralDamageProbabilities( ...
    PD, inputs.tables.sdsTables, ...
    filenamesCell, uniqueTypesCell, ...
    inputs.outputFolder);

%%  STEP 5 — SDS SUMMARY  (FIXED SIGNATURE)
[Summary_ProbExc, Summary_Table] = computeSDS_Summary( ...
    [], ...                         
    PD, filenamesCell, ...
    inputs.Depth_Ranges, ...
    inputs.depthLabel, ...
    inputs.threshold, ...
    inputs.outputFolder);

%%  STEP 6 — SDS DETAILED

Detailed_SDS = computeSDS_DetailedIndustry( ...
    PD, uniqueTypesCell, inputs.damageStates, ...
    filenamesCell, ...
    inputs.Depth_Ranges, ...
    inputs.depthLabel, ...
    inputs.threshold, ...
    inputs.outputFolder);
%%  STEP 7 — LOSS
if isfield(inputs.tables,'Loss') && ~isempty(inputs.tables.Loss)

    [PD, Detailed_LossRatio_Table, Summary_LossRatio] = computeLossRatio( ...
        PD, inputs.tables.Loss, ...
        uniqueTypesCell, ...
        inputs.Depth_Ranges, ...
        inputs.threshold, ...
        inputs.outputFolder);

else
    warning('Loss table missing — skipping.');

    Detailed_LossRatio_Table = table();
    Summary_LossRatio = [];

    for i = 1:numel(PD)
        PD(i).LossRatio = NaN;
    end
end

%%  STEP 8 — RECOVERY
if isfield(inputs.tables,'Recovery') && ~isempty(inputs.tables.Recovery)

   [PD, Detailed_Recovery, RecoveryOverview, Summary_RecoveryPotential] = ...
        computeRecoveryPotential( ...
            PD, inputs.tables.Recovery, ...
            inputs.Depth_Ranges, ...
            inputs.threshold, ...
            inputs.outputFolder);

else
    warning('Recovery table missing — skipping.');

    Detailed_Recovery = table();
    RecoveryOverview = table();
    Summary_RecoveryPotential = table();
end

%%  STEP 9 — FINAL SAFETY CHECKS
if ~isfield(PD,'LossRatio')
    for i = 1:numel(PD)
        PD(i).LossRatio = NaN;
    end
end

for i = 1:numel(PD)
    if ~isfield(PD(i),'DepthGroup')
        PD(i).DepthGroup = 0;
    end
end

%%  STEP 10 — BUILD OUTPUT STRUCT 
results = struct();

results.PolyData = PD;

%  INUNDATION
results.InundationCount   = InundationCount;
results.InundationSummary = InundationSummary;

%  STRUCTURAL DAMAGE
results.SDS_Summary      = Summary_Table;
results.Summary_ProbExc  = Summary_ProbExc;
results.SDS_Detailed     = Detailed_SDS;

%  LOSS (FIXED )
results.Detailed_LossRatio_Table = Detailed_LossRatio_Table;
results.Summary_LossRatio        = Summary_LossRatio;

%  RECOVERY
results.Recovery_Detailed           = Detailed_Recovery;
results.Recovery_Overview           = RecoveryOverview;
results.Summary_RecoveryPotential   = Summary_RecoveryPotential;

%  TYPES
results.uniqueTypes = uniqueTypesCell;

end