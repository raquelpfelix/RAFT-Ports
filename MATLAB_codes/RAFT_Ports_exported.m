classdef RAFT_Ports_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        RAFTPortsUIFigure               matlab.ui.Figure
        TabGroup2                       matlab.ui.container.TabGroup
        GeneralTab                      matlab.ui.container.Tab
        OutputLabel                     matlab.ui.control.Label
        Output                          matlab.ui.container.Panel
        GenerateReportButton            matlab.ui.control.Button
        ReportbyEditFieldLabel          matlab.ui.control.Label
        ReportbyEditField               matlab.ui.control.EditField
        OutputDirectoryButton           matlab.ui.control.Button
        DirectoryEditField              matlab.ui.control.EditField
        OutputDirectoryLabel            matlab.ui.control.Label
        ModeLabel                       matlab.ui.control.Label
        Mode                            matlab.ui.container.Panel
        ProbabilityThreshold            matlab.ui.control.NumericEditField
        ProbabilityThresholdLabel       matlab.ui.control.Label
        ExtractDepthDropDown            matlab.ui.control.DropDown
        DepthValueTypeLabel             matlab.ui.control.Label
        FactorEditField                 matlab.ui.control.NumericEditField
        xLabel_2                        matlab.ui.control.Label
        ResampleRasterDropDown          matlab.ui.control.DropDown
        ResamplingMethodLabel           matlab.ui.control.Label
        AnalysisLabel                   matlab.ui.control.Label
        InputDataLabel                  matlab.ui.control.Label
        InputData                       matlab.ui.container.Panel
        UploadPolygons                  matlab.ui.control.Button
        StructureFileEditField          matlab.ui.control.EditField
        StructureFileEditFieldLabel     matlab.ui.control.Label
        UploadInundation                matlab.ui.control.Button
        InundationFileEditField         matlab.ui.control.EditField
        InundationFileEditFieldLabel    matlab.ui.control.Label
        Analysis                        matlab.ui.container.Panel
        LossRatioRepairReplacementCheckBox  matlab.ui.control.CheckBox
        RecoveryPotentialofProductionCapacityCheckBox  matlab.ui.control.CheckBox
        StructuralDamageStateCheckBox   matlab.ui.control.CheckBox
        ModifyValuesTab                 matlab.ui.container.Tab
        ResettoDefaultValuesButton      matlab.ui.control.Button
        NumbersareeditableinthetableLabel  matlab.ui.control.Label
        EditTableHeadersButton          matlab.ui.control.Button
        ViewFragilityCurveValuesforLabel  matlab.ui.control.Label
        FragilityCurveDropdownList      matlab.ui.control.DropDown
        FragilityCurveMainTabs          matlab.ui.container.TabGroup
        StructuralDamageTab             matlab.ui.container.Tab
        StrucDamageList                 matlab.ui.container.TabGroup
        MinorTab                        matlab.ui.container.Tab
        Table_MinorSDS                  matlab.ui.control.Table
        ModerateTab                     matlab.ui.container.Tab
        Table_ModerateSDS               matlab.ui.control.Table
        MajorTab                        matlab.ui.container.Tab
        Table_MajorSDS                  matlab.ui.control.Table
        DestroyedTab                    matlab.ui.container.Tab
        Table_DestroyedSDS              matlab.ui.control.Table
        LossTab                         matlab.ui.container.Tab
        Table_LossRatio                 matlab.ui.control.Table
        RecoveryPotentialTab            matlab.ui.container.Tab
        Table_RecoveryPotential         matlab.ui.control.Table
        EditTypeTab                     matlab.ui.container.Tab
        ForRecoveryPotentialLabel       matlab.ui.control.Label
        Headers_RecoveryPotential       matlab.ui.container.Panel
        DepthMore_Edit                  matlab.ui.control.EditField
        DepthLess_Edit                  matlab.ui.control.EditField
        NoInundation_Edit               matlab.ui.control.EditField
        months_Edit                     matlab.ui.control.EditField
        EditTableHeadersLabel           matlab.ui.control.Label
        ForDamageStateLossRatioLabel    matlab.ui.control.Label
        Headers_SDSandLoss              matlab.ui.container.Panel
        petrochemical_Edit              matlab.ui.control.EditField
        transportation_Edit             matlab.ui.control.EditField
        Depth_Edit                      matlab.ui.control.EditField
        warehouse_Edit                  matlab.ui.control.EditField
        energy_Edit                     matlab.ui.control.EditField
        manufacturing_Edit              matlab.ui.control.EditField
        food_Edit                       matlab.ui.control.EditField
        construction_Edit               matlab.ui.control.EditField
        chemical_Edit                   matlab.ui.control.EditField
        cargo_Edit                      matlab.ui.control.EditField
        ModifyMapsTab                   matlab.ui.container.Tab
        PreviewMapsButton               matlab.ui.control.Button
        CloseFiguresButton              matlab.ui.control.Button
        FigureResolutiondpiEditField    matlab.ui.control.NumericEditField
        FigureResolutiondpiLabel        matlab.ui.control.Label
        InundationBackgroundMapLabel_4  matlab.ui.control.Label
        InundationMapLabel              matlab.ui.control.Label
        MapBoundary                     matlab.ui.container.Panel
        ResetButton                     matlab.ui.control.Button
        WestEditField                   matlab.ui.control.NumericEditField
        WestEditFieldLabel              matlab.ui.control.Label
        EastEditField                   matlab.ui.control.NumericEditField
        EastEditFieldLabel              matlab.ui.control.Label
        NorthEditFieldLabel_2           matlab.ui.control.Label
        SouthEditField                  matlab.ui.control.NumericEditField
        NorthEditField                  matlab.ui.control.NumericEditField
        NorthEditFieldLabel             matlab.ui.control.Label
        InundationMap                   matlab.ui.container.Panel
        InundationColorbar_Flip         matlab.ui.control.CheckBox
        InundationDivisionEditField     matlab.ui.control.NumericEditField
        ColourDivisionLabel             matlab.ui.control.Label
        InundationColorMap              matlab.ui.control.DropDown
        DepthColours                    matlab.ui.control.Label
        toLabel                         matlab.ui.control.Label
        Colorbar_Max                    matlab.ui.control.NumericEditField
        Colorbar_Min                    matlab.ui.control.NumericEditField
        DepthRange                      matlab.ui.control.Label
        PolygonsLabel                   matlab.ui.control.Label
        Polygons                        matlab.ui.container.Panel
        LandColourDropDown              matlab.ui.control.DropDown
        Unaffected_PolygonColorDropdown_Label_2  matlab.ui.control.Label
        FileEditField                   matlab.ui.control.EditField
        FileEditFieldLabel              matlab.ui.control.Label
        UploadLandPolygon               matlab.ui.control.Button
        LandAreaLabel                   matlab.ui.control.Label
        Unaffected_PolygonColorDropdown  matlab.ui.control.DropDown
        Unaffected_PolygonColorDropdown_Label  matlab.ui.control.Label
        PolygonColorDropdown            matlab.ui.control.DropDown
        ColorDropDown_3Label            matlab.ui.control.Label
        StructuresLabel                 matlab.ui.control.Label
    end

% RAFT-Ports
% Copyright 2026 Raquel Felix
%
% Licensed under the Apache License, Version 2.0.
%For details: see LICENSE file in https://github.com/raquelpfelix/RAFT-Ports/
%
% Unless required by applicable law or agreed to in writing, this
% software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
% OR CONDITIONS OF ANY KIND.

properties (Access = public)

    %% Core shared parameters
    Depth_Ranges
    NumDepthBins
    pastelColors
    typesMaster
    TypeLegendColors
    

    %%  Default UI storage
    DefaultHeaderValues
    DefaultTables
    OriginalRecoveryTable

    %%  File & directory
    FullDirectory
    WorkDirectoryUserSet

    %%  Raster / inundation
    InundationFullPath
    InundationData
    InundationGeoRef

    %%  Resolution
    latResolution
    lonResolution
    InterpLatResolution
    InterpLonResolution
    CoordSystemUnit

    %%  Polygon data
    PolyData
    LandPolyData

    %% Output storage (IMPORTANT )
    ReferenceTable
    InundationCount
    Summary_ProbExc
    Summary_ProbExc_Table
    Summary_LossRatio
    Detailed_LossRatio_Table
    Summary_RecoveryPotential
    Detailed_Recovery

    %%  Raster bounds
    TIFFeast
    TIFFnorth
    TIFFsouth
    TIFFwest
end
    


methods (Access = public)
 %% ============================================================
    % ERROR HANDLING for the directory
    %===============================================================
    function showError(app, ME, messageText)

        % Display user-friendly popup
        uialert(app.RAFTPortsUIFigure, ...
            sprintf('%s:\n%s', messageText, ME.message), ...
            'Error', 'Icon', 'error');

    end

    %% ============================================================
    % CANCEL HANDLING
    %===============================================================
    function checkCancel(app,d)

        if d.CancelRequested

            if isvalid(d)
                d.Message = "Cancelling...";
                drawnow;
                pause(0.3);
                close(d);
            end

            error('RAFT:Cancelled', ...
                'Process cancelled by user.');

        end

    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% UPDATE ALL INDUSTRY HEADERS (Structural Damage States + Loss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function updateIndustryHeaders(app)

    %%  BUILD HEADERS USING FUNCTIONS

    validNamesSDS = buildSDSHeaders( ...
        app.Depth_Edit.Value, ...
        app.cargo_Edit.Value, ...
        app.chemical_Edit.Value, ...
        app.construction_Edit.Value, ...
        app.food_Edit.Value, ...
        app.manufacturing_Edit.Value, ...
        app.petrochemical_Edit.Value, ...
        app.energy_Edit.Value, ...
        app.warehouse_Edit.Value);

    validNamesLoss = buildLossHeaders( ...
        app.Depth_Edit.Value, ...
        app.cargo_Edit.Value, ...
        app.chemical_Edit.Value, ...
        app.construction_Edit.Value, ...
        app.energy_Edit.Value, ...
        app.food_Edit.Value, ...
        app.manufacturing_Edit.Value, ...
        app.petrochemical_Edit.Value, ...
        app.warehouse_Edit.Value, ...
        app.transportation_Edit.Value);

    % APPLY TO TABLES

    app.Table_MinorSDS.ColumnName     = validNamesSDS;
    app.Table_ModerateSDS.ColumnName  = validNamesSDS;
    app.Table_MajorSDS.ColumnName     = validNamesSDS;
    app.Table_DestroyedSDS.ColumnName = validNamesSDS;

    app.Table_LossRatio.ColumnName    = validNamesLoss;

    drawnow;

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% UPDATE ALL INDUSTRY HEADERS (Recovery)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function updateRecoveryHeaders(app)
        %Ensure defaults
        if strlength(strtrim(string(app.months_Edit.Value))) == 0
            app.months_Edit.Value = 'months';
        end

        if strlength(strtrim(string(app.NoInundation_Edit.Value))) == 0
            app.NoInundation_Edit.Value = 'No_Inundation';
        end

        if strlength(strtrim(string(app.DepthLess_Edit.Value))) == 0
            app.DepthLess_Edit.Value = 'Less_than_3m';
        end

        if strlength(strtrim(string(app.DepthMore_Edit.Value))) == 0
            app.DepthMore_Edit.Value = 'More_than_3m';
        end

        %Build headers
        validNames = buildRecoveryHeaders( ...
            app.months_Edit.Value, ...
            app.NoInundation_Edit.Value, ...
            app.DepthLess_Edit.Value, ...
            app.DepthMore_Edit.Value);

        %Apply
        app.Table_RecoveryPotential.ColumnName = validNames;
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  GENERIC TABLE VALIDATION (ALL TABLES)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function validateTableMonotonic(app, src, event)
% ===========================================================
% VALIDATION FOR NUMERIC TABLES
%
%  Rejects decreasing values
%  Allows equal values BUT shows warning
%  Runs on every cell edit
%  Standalone-compatible
% ===========================================================

    tbl = src;

    % Cell position
    row = event.Indices(1);
    col = event.Indices(2);

    T = tbl.Data;

    %% =======================================================
    %%  Extract column (numeric)
    %% =======================================================
    try
        if istable(T)
            colVec = T{:,col};
        else
            colVec = T(:,col);
        end
    catch
        app.revertGeneric(tbl, event, 'Error reading column.');
        return;
    end

    %% =======================================================
    %%  New value
    %% =======================================================
    newVal = event.NewData;

    if ~isnumeric(newVal) || isempty(newVal) || isnan(newVal)
        app.revertGeneric(tbl, event, ...
            'Only numeric values are allowed.');
        return;
    end

    % Insert temporarily
    colVec(row) = newVal;

    %% =======================================================
    %%  Check previous value
    %% =======================================================
    if row > 1
        prev = colVec(row-1);

        if newVal < prev
            % ❌ Reject
            app.revertGeneric(tbl, event, ...
                sprintf(['Values must increase down the column.\n\n' ...
                'Row %d is smaller than Row %d.'], ...
                row, row-1));
            return;

        elseif newVal == prev
            % ⚠️ WARNING ONLY (DO NOT REVERT)
            uialert(app.RAFTPortsUIFigure, ...
                sprintf(['Warning: Value in Row %d is equal to Row %d.\n' ...
                'Values should ideally increase.'], ...
                row, row-1), ...
                'Monotonic Warning');
        end
    end

    %% =======================================================
    %%  Check next value
    %% =======================================================
    if row < numel(colVec)
        nxt = colVec(row+1);

        if newVal > nxt
            % ❌ Reject
            app.revertGeneric(tbl, event, ...
                sprintf(['Values must increase down the column.\n\n' ...
                'Row %d is larger than Row %d.'], ...
                row, row+1));
            return;

        elseif newVal == nxt
            % ⚠️ WARNING ONLY
            uialert(app.RAFTPortsUIFigure, ...
                sprintf(['Warning: Value in Row %d is equal to Row %d.\n' ...
                'Values should ideally increase.'], ...
                row, row+1), ...
                'Monotonic Warning');
        end
    end

    %% =======================================================
    %%  Commit value (ALWAYS if we reached here)
    %% =======================================================
    try
        if istable(T)
            T{row,col} = newVal;
        else
            T(row,col) = newVal;
        end

        tbl.Data = T;

    catch
        app.revertGeneric(tbl, event, 'Error updating value.');
    end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERIC REVERT FUNCTION FOR TABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function revertGeneric(app, tbl, event, message)

    row = event.Indices(1);
    col = event.Indices(2);

    T = tbl.Data;

    %  Restore previous value safely
    if ~isempty(event.PreviousData)
        T{row,col} = event.PreviousData;
    else
        T{row,col} = NaN;
    end

    tbl.Data = T;

    drawnow;

    uialert(app.RAFTPortsUIFigure, message, 'Invalid Input');

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ATTACH VALIDATOR TO ALL TABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function attachTableValidators(app)
    % ===========================================================
    % Attaches validation to ALL tables
    % ===========================================================

    tblList = { ...
        app.Table_MinorSDS, ...
        app.Table_ModerateSDS, ...
        app.Table_MajorSDS, ...
        app.Table_DestroyedSDS, ...
        app.Table_LossRatio, ...
        app.Table_RecoveryPotential };

    for i = 1:numel(tblList)

        tbl = tblList{i};

        % Skip invalid handles
        if isempty(tbl) || ~isvalid(tbl)
            continue;
        end

        %  Attach callback (THIS IS THE KEY LINE)
        tbl.CellEditCallback = @(src,event) ...
            app.validateTableMonotonic(src,event);

    end
end

end

%% % FOR CREATING PDF REPORT %%%%
methods (Access = private)
% ===========================================================
% Add Section Header
% ===========================================================
function addSectionHeader(app, pdfDoc, textStr, fontSize)

    import mlreportgen.dom.*

    % Create text object
    t = Text(textStr);
    t.FontSize = fontSize;
    t.Bold     = true;

    % Wrap in paragraph and center
    p = Paragraph(t);
    p.HAlign = 'center';

    append(pdfDoc, p);

end


% ===========================================================
% Add Text Line
% ===========================================================
function addTextLine(app, pdfDoc, textStr, fontSize)

    import mlreportgen.dom.*

    t = Text(textStr);
    t.FontSize = fontSize;

    p = Paragraph(t);
    p.HAlign = 'center';

    append(pdfDoc, p);

end


% ===========================================================
% Add Image
% ===========================================================
function addImage(app, pdfDoc, imagePath)

    import mlreportgen.dom.*

    % Check file exists
    if exist(imagePath, 'file') ~= 2
        return;
    end

    % Create image
    img = Image(imagePath);

    % =======================================================
    % Auto-scale image (based on DPI)
    % =======================================================
    try
        info = imfinfo(imagePath);

        pxH = double(info.Height);
        dpi = app.FigureResolutiondpiEditField.Value;

        heightCm = (pxH / dpi) * 2.54;

        if heightCm > 7
            img.Height = '18cm';
            img.Width  = [];   % preserve aspect ratio
        end
    catch
        % Safe fallback if metadata fails
    end

    img.Style = [img.Style {ScaleToFit}];

    % Center image
    p = Paragraph();
    p.HAlign = 'center';

    append(p, img);
    append(pdfDoc, p);

end


% ===========================================================
% Add Table from CSV
% ===========================================================
function addTableFromCSV(app, pdfDoc, csvPath)

    import mlreportgen.dom.*

    % Check file exists
    if exist(csvPath, 'file') ~= 2
        append(pdfDoc, Paragraph('File not found.'));
        return;
    end

    % Read table
    opts = detectImportOptions(csvPath, 'Delimiter', ',');
    opts.VariableNamingRule = 'preserve';

    T = readtable(csvPath, opts);

    % Create DOM table
    domTable = Table();
    domTable.Border = 'solid';
    domTable.ColSep = 'solid';
    domTable.RowSep = 'solid';
    domTable.HAlign = 'center';


    % =========================
    % Header row
    % =========================
    headers = T.Properties.VariableNames;
    headerRow = TableRow();

    for i = 1:numel(headers)

        th = Text([' ' headers{i} ' ']);
        th.Bold = true;

        entry = TableEntry();
        entry.Style = {HAlign('center')};

        append(entry, th);
        append(headerRow, entry);

    end

    append(domTable, headerRow);


    % =========================
    % Data rows
    % =========================
    for r = 1:height(T)

        row = TableRow();

        for c = 1:width(T)

            val = T{r,c};

            if ismissing(val)
                str = '';

            elseif isnumeric(val)
                if isfinite(val)
                    str = sprintf('%.6g', val);
                else
                    str = '';
                end

            else
                str = char(string(val));
            end

            td = TableEntry();
            td.Style = {HAlign('center')};

            append(td, Text(str));
            append(row, td);

        end

        append(domTable, row);

    end

    append(pdfDoc, domTable);

end


% ===========================================================
% Add Page Break
% ===========================================================
function addPageBreak(app, pdfDoc)

    import mlreportgen.dom.*

    append(pdfDoc, PageBreak());

end


function addFormattedCSVTable(app, pdfDoc, csvPath)

    import mlreportgen.dom.*

    % =========================
    % File check
    % =========================
    if exist(csvPath, 'file') ~= 2
        warnPara = Paragraph(['File not found: ' char(string(csvPath))]);
        warnPara.Color = 'red';
        warnPara.HAlign = 'center';
        append(pdfDoc, warnPara);
        append(pdfDoc, Paragraph(' '));
        return;
    end

    % =========================
    % Read table safely
    % =========================
    try
        opts = detectImportOptions(csvPath, 'Delimiter', ',');
        opts.VariableNamingRule = 'preserve';
        T = readtable(csvPath, opts);
    catch ME
        errPara = Paragraph(['Failed to read file: ' ME.message]);
        errPara.Color = 'red';
        append(pdfDoc, errPara);
        append(pdfDoc, Paragraph(' '));
        return;
    end


    % =========================
    % Create DOM table
    % =========================
    domTable = Table();
    domTable.TableEntriesStyle = {InnerMargin('2pt','2pt','2pt','2pt')};
    domTable.Border = 'solid';
    domTable.ColSep = 'solid';
    domTable.RowSep = 'solid';
    domTable.HAlign = 'center';


    % =========================
    % ---- Header row ----
    % =========================
    headers = string(T.Properties.VariableNames);
    headerRow = TableRow();

    for h = 1:numel(headers)

        prettyHeader = strrep(char(headers(h)), '_', ' ');

        txt = Text([' ' prettyHeader ' ']);
        txt.Bold = true;
        txt.FontSize = '10pt';

        entry = TableEntry();
        entry.Style = {HAlign('center')};

        append(entry, txt);
        append(headerRow, entry);
    end

    append(domTable, headerRow);


    % =========================
    % ---- Data rows ----
    % =========================
    for r = 1:height(T)

        row = TableRow();

        for c = 1:width(T)

            v = T{r,c};

            % -------- SAFE CONVERSION --------
            if any(ismissing(v), 'all') || (ischar(v) && isempty(v))
                cellStr = '';

            elseif ischar(v) || isstring(v) || iscategorical(v) || ...
                    isdatetime(v) || isduration(v)

                s = string(v);
                if ~isscalar(s), s = s(1); end
                cellStr = char(s);

            elseif isnumeric(v)

                if isscalar(v) && isfinite(v)

                    if abs(v - round(v)) < 1e-12
                        cellStr = sprintf('%d', round(v));
                    else
                        cellStr = sprintf('%.6g', v);
                    end

                else
                    vf = v(isfinite(v));

                    if isempty(vf)
                        cellStr = '';
                    else
                        x = vf(1);
                        if abs(x - round(x)) < 1e-12
                            cellStr = sprintf('%d', round(x));
                        else
                            cellStr = sprintf('%.6g', x);
                        end
                    end
                end

            else
                s = string(v);
                if ~isscalar(s), s = s(1); end
                cellStr = char(s);
            end


            td = TableEntry();
            td.Style = {HAlign('center')};

            append(td, Text(cellStr));
            append(row, td);

        end

        append(domTable, row);
    end

    append(pdfDoc, domTable);
    append(pdfDoc, Paragraph(' '));

end



% ===========================================================
% Generate PDF Report (Main Pipeline)
% ===========================================================
function generatePDFReport(app)

    import mlreportgen.dom.*

    % -------------------------------------------
    % Create PDF
    % -------------------------------------------
    pdfPath = fullfile(app.FullDirectory, 'Report.pdf');

    if exist(pdfPath,'file') == 2

        try
            delete(pdfPath);

        catch

            uialert(app.RAFTPortsUIFigure, ...
                ['Please close Report.pdf before generating a new report.' ...
                newline newline pdfPath], ...
                'PDF File Open');

            return;

        end

    end

    pdfDoc = mlreportgen.dom.Document(pdfPath,'pdf');
    % -------------------------------------------
    % Progress dialog
    % -------------------------------------------
    d = uiprogressdlg(app.RAFTPortsUIFigure, ...
        'Title', 'Generating Report', ...
        'Message', 'Initializing...', ...
        'Indeterminate', 'off', ...
        'Value', 0);

    totalSteps = 7;
    step = 0;

    try

        open(pdfDoc);

        % -------------------------------------------
        % Pipeline execution
        % -------------------------------------------
        step = app.addFrontPage(pdfDoc, d, step, totalSteps);
        % step = app.addMethodPage(pdfDoc, d, step, totalSteps);
        step = app.addOverviewSection(pdfDoc, d, step, totalSteps);
        step = app.addInundationSection(pdfDoc, d, step, totalSteps);

        if app.StructuralDamageStateCheckBox.Value
            step = app.addStructuralDamageSection( ...
                pdfDoc, d, step, totalSteps);
        end

        if app.LossRatioRepairReplacementCheckBox.Value
            step = app.addLossRatioSection( ...
                pdfDoc, d, step, totalSteps);
        end

        if app.RecoveryPotentialofProductionCapacityCheckBox.Value
            step = app.addRecoverySection( ...
                pdfDoc, d, step, totalSteps);
        end

        % -------------------------------------------
        % Finalize report
        % -------------------------------------------
        step = app.finalizeReport( ...
            pdfDoc, d, step, totalSteps);

        % -------------------------------------------
        % Close PDF document
        % -------------------------------------------
        if exist('pdfDoc','var')

            try
                close(pdfDoc);
            catch
            end

        end

        % -------------------------------------------
        % Close progress dialog
        % -------------------------------------------
        if isvalid(d)
            close(d);
        end

        % -------------------------------------------
        % Success message
        % -------------------------------------------
        uialert(app.RAFTPortsUIFigure, ...
            'Report generated successfully!', ...
            'Done', ...
            'Icon','success');

        % -------------------------------------------
        % Open PDF
        % -------------------------------------------
        open(pdfPath);

    catch ME

        % -------------------------------------------
        % Safely close document if error occurs
        % -------------------------------------------
        try
            if exist('pdfDoc','var')
                close(pdfDoc);
            end
        catch
        end

        % -------------------------------------------
        % Close progress dialog
        % -------------------------------------------
        try
            if isvalid(d)
                close(d);
            end
        catch
        end

        % -------------------------------------------
        % User-friendly error message
        % -------------------------------------------
        showError(app, ME, ...
            "PDF report generation failed");

        return;

    end
end

% ===========================================================
% Front Page
% ===========================================================
function step = addFrontPage(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Update progress
    % ===========================================================
    d.Message = 'Creating front page...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;


    % ===========================================================
    % Footer with page numbers
    % ===========================================================
    footer = PDFPageFooter();

    pagePara = Paragraph(' ');
    pagePara.WhiteSpace = 'preserve';
    pagePara.HAlign = 'center';

    pageText   = Text('Page ');
    pageNumber = Page();
    ofText     = Text(' of ');
    numPages   = NumPages();

    styleObj = {FontSize('8pt'), Color('darkgray')};
    pageText.Style   = styleObj;
    pageNumber.Style = styleObj;
    ofText.Style     = styleObj;
    numPages.Style   = styleObj;

    append(pagePara, pageText);
    append(pagePara, pageNumber);
    append(pagePara, ofText);
    append(pagePara, numPages);

    append(footer, pagePara);
    pdfDoc.CurrentPageLayout.PageFooters = footer;


    % ===========================================================
    % Title
    % ===========================================================
    append(pdfDoc, HorizontalRule());
    append(pdfDoc, Paragraph(' '));

    t = Text('Tsunami Risk Assessment Report');
    t.Bold = true;
    t.FontSize = '15pt';
    p = Paragraph(t); p.HAlign = 'center';
    append(pdfDoc, p);

    t = Text('generated using RAFT-Ports by Felix, et al. (2026)');
    t.FontSize = '12pt';
    p = Paragraph(t); p.HAlign = 'center';
    append(pdfDoc, p);

    append(pdfDoc, HorizontalRule());



    % ===========================================================
    % Contents
    % ===========================================================
    for i = 1:3
        append(pdfDoc, Paragraph(' '));
    end

    t = Text('Contents:');
    t.Bold = true;
    t.FontSize = '13pt';
    append(pdfDoc, Paragraph(t));

    txt = Text('Inundated Structures');
    txt.FontSize = '11pt';
    append(pdfDoc, Paragraph(txt));

    if app.StructuralDamageStateCheckBox.Value

        txt = Text('Structural Damage States');
        txt.FontSize = '11pt';

        append(pdfDoc, Paragraph(txt));

    end

    if app.LossRatioRepairReplacementCheckBox.Value

        txt = Text('Physical Loss Ratio (Repair / Replacement)');
        txt.FontSize = '11pt';

        append(pdfDoc, Paragraph(txt));

    end

    if app.RecoveryPotentialofProductionCapacityCheckBox.Value

        txt = Text('Recovery of Production Capacity');
        txt.FontSize = '11pt';

        append(pdfDoc, Paragraph(txt));

    end

    for i = 1:2
        append(pdfDoc, Paragraph(' '));
    end

% ===========================================================
% Input Files
% ===========================================================
if ~isempty(app.InundationFileEditField.Value) && ~isempty(app.StructureFileEditField.Value)
    inputgeneraltext = mlreportgen.dom.Text('Input Files:');

    t1  = mlreportgen.dom.Text('Inundation: ');
    t2  = mlreportgen.dom.Text(app.InundationFileEditField.Value);

    t3  = mlreportgen.dom.Text('File Resolution: ');
    %     t4  = mlreportgen.dom.Text(sprintf('%.6f', app.latResolution));
    t4 = mlreportgen.dom.Text(char(app.latResolution));
    t5  = mlreportgen.dom.Text(', ');
    t6 = mlreportgen.dom.Text(char(app.lonResolution));

    %     t6  = mlreportgen.dom.Text(sprintf('%.6f', app.lonResolution));
    t7  = mlreportgen.dom.Text(' ');
    t8  = mlreportgen.dom.Text(app.CoordSystemUnit);

    t9  = mlreportgen.dom.Text('Structures: ');
    t10 = mlreportgen.dom.Text(app.StructureFileEditField.Value);

    t11 = mlreportgen.dom.Text('Raster Resampling Method: ');

    if strcmp(app.ResampleRasterDropDown.Value,'No')
        t12 = mlreportgen.dom.Text('None');
    else
        t12 = mlreportgen.dom.Text(app.ResampleRasterDropDown.Value);
    end

    if app.FactorEditField.Enable && app.FactorEditField.Value ~= 0

        t15 = mlreportgen.dom.Text('Resampling Factor: ');
        t16 = mlreportgen.dom.Text(sprintf('%.2f', app.FactorEditField.Value));

        t13  = mlreportgen.dom.Text('Updated Resolution: ');
        t14a = mlreportgen.dom.Text(char(app.InterpLatResolution));
%         t14a = mlreportgen.dom.Text(sprintf('%.6f', app.InterpLatResolution));
        t14b = mlreportgen.dom.Text(', ');
%         t14c = mlreportgen.dom.Text(sprintf('%.6f', app.InterpLonResolution));
        t14c = mlreportgen.dom.Text(char(app.InterpLonResolution));
        t14d = mlreportgen.dom.Text(' ');
        t14e = mlreportgen.dom.Text(app.CoordSystemUnit);

    end

    t17  = mlreportgen.dom.Text('Depth extracted within the building mask: ');
    t18 = mlreportgen.dom.Text(app.ExtractDepthDropDown.Value);
    t19 = mlreportgen.dom.Text('Probability Threshold: ');
    t20 = mlreportgen.dom.Text(sprintf('%.2f', app.ProbabilityThreshold.Value));
    x = app.ProbabilityThreshold.Value * 100;
    msg = sprintf('Only structures meeting or exceeding this threshold are counted in the results');
    t21 = mlreportgen.dom.Text(msg);

    % Format style of the texts
    inputgeneraltext.FontSize = '13pt';
    t1.FontSize = '11pt'; t2.FontSize = '11pt';
    t3.FontSize = '11pt'; t4.FontSize = '11pt';
    t5.FontSize = '11pt'; t6.FontSize = '11pt';
    t7.FontSize = '11pt'; t8.FontSize = '11pt';
    t9.FontSize = '11pt'; t10.FontSize = '11pt';
    t11.FontSize = '11pt'; t12.FontSize = '11pt';
    t13.FontSize = '11pt'; t14a.FontSize = '11pt'; t14b.FontSize = '11pt'; t14c.FontSize = '11pt';
    t15.FontSize = '11pt'; t16.FontSize = '11pt';
    t17.FontSize = '11pt'; t18.FontSize = '11pt';
    t19.FontSize = '11pt'; t20.FontSize = '11pt'; t21.FontSize = '11pt';

    inputgeneraltext.Bold = true;
    t1.Bold = true; t3.Bold = true; t9.Bold = true; t11.Bold = true;
    t13.Bold = true; t15.Bold = true; t17.Bold = true; t19.Bold = true;

    inputgeneraltext.Bold = true;
    t1.Bold = true;  t3.Bold = true;  t9.Bold = true; t11.Bold = true;
    t13.Bold = true; t15.Bold = true; t17.Bold = true; t19.Bold = true;

    % Add the paragraphs to the pdf
    p1 = mlreportgen.dom.Paragraph(' ');
    p2 = mlreportgen.dom.Paragraph(' ');
    p3 = mlreportgen.dom.Paragraph(' ');
    p4 = mlreportgen.dom.Paragraph(' ');
    p5 = mlreportgen.dom.Paragraph(' ');
    p6 = mlreportgen.dom.Paragraph(' ');
    p7 = mlreportgen.dom.Paragraph(' ');
    p8 = mlreportgen.dom.Paragraph(' ');
    p9 = mlreportgen.dom.Paragraph(' ');

    append(p1, t1);  append(p1, t2);
    append(p2, t3);  append(p2, t4); append(p2, t5); append(p2, t6); append(p2, t7); append(p2, t8);
    append(p3, t9);  append(p3, t10);
    append(p4, t11); append(p4, t12);
 
    append(p6, t17); append(p6, t18);
    append(p7, t19); append(p7, t20);  append(p9, t21);

    append(pdfDoc, mlreportgen.dom.Paragraph(inputgeneraltext));
    append(pdfDoc, p1);
    append(pdfDoc, p2);
    append(pdfDoc, p3);
    append(pdfDoc, mlreportgen.dom.Paragraph(' '));
    append(pdfDoc, p4);
    if app.FactorEditField.Enable == true && app.FactorEditField.Value ~=0
        append(p5, t15); append(p5, t16);
        append(p8, t13); append(p8, t14a); append(p8, t14b); append(p8, t14c); append(p8, t14d); append(p8, t14e);
        append(pdfDoc, p5);
        append(pdfDoc, p8);
    end
    append(pdfDoc, p6);
    append(pdfDoc, p7);
    append(pdfDoc, p9);
end

% Add spacing before the 'User Info' section
for i = 1:3
    append(pdfDoc, mlreportgen.dom.Paragraph(' '));
end






    % ===========================================================
    % User Info
    % ===========================================================
    for i = 1:2
        append(pdfDoc, Paragraph(' '));
    end

    if ~isempty(app.ReportbyEditField.Value)
        p = Paragraph(' ');
        t1 = Text('Report created by: '); t1.Bold = true;
        append(p, t1);
        append(p, Text(char(string(app.ReportbyEditField.Value))));
        append(pdfDoc, p);
    end

    p = Paragraph(' ');
    t1 = Text('Date created: '); t1.Bold = true;
    append(p, t1);
    append(p, Text(char(string(datetime("now",'Format','dd-MMM-yyyy')))));
    append(pdfDoc, p);


    % ===========================================================
    % Disclaimer
    % ===========================================================
    for i = 1:2
        append(pdfDoc, Paragraph(' '));
    end

    

    t = Text(char(string([ ...
    'RAFT-Ports: Risk Assessment for Tsunamis in Ports. ' ...
    'RAFT-Ports provides scenario-based tsunami impact assessments to support risk-informed decision-making. ' ...
    'Results are subject to uncertainties in input data, model assumptions, and the fragility and vulnerability functions used in the analysis. ' ...
    'Users should independently review and validate all inputs and results prior to application.' ])));

    t.FontSize = '9pt';
    t.Color = 'darkgray';

    p = Paragraph(t);
    p.HAlign = 'justify';

    append(pdfDoc, p);


    % ===========================================================
    % Page break
    % ===========================================================
    append(pdfDoc, PageBreak());

end

% % ===========================================================
% % Method Page
% % ===========================================================
% function step = addMethodPage(app, pdfDoc, d, step, totalSteps)
% 
%     % Progress update
%     d.Message = 'Adding method overview...';
%     step = step + 1;
%     d.Value = step / totalSteps;
%     drawnow;
% 
%     % Images
%     app.addImage(pdfDoc, ...
%         fullfile(app.FullDirectory, 'method_overview_Page_1.png'));
% 
%     app.addImage(pdfDoc, ...
%         fullfile(app.FullDirectory, 'method_overview_Page_2.png'));
% 
% end


% ===========================================================
% Overview Section
% ===========================================================
function step = addOverviewSection(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Update progress
    % ===========================================================
    d.Message = 'Adding results overview...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;


    % ===========================================================
    % Section Header
    % ===========================================================
    secTitle = Text('Overview of the Results');
    secTitle.FontSize = '14pt';
    secTitle.Bold = true;

    secPara = Paragraph(secTitle);
    secPara.HAlign = 'center';

    append(pdfDoc, secPara);


    % ===========================================================
    % Structure count
    % ===========================================================
    numRows = numel(app.PolyData);

    msgStr  = sprintf('Based on the analysis of %d structures', numRows);
    infoText = Text(msgStr);
    infoText.FontSize = '11pt';

    infoPara = Paragraph(infoText);
    infoPara.HAlign = 'center';

    append(pdfDoc, infoPara);
    append(pdfDoc, Paragraph(' '));
    append(pdfDoc, Paragraph(' '));


    % ===========================================================
    % Build CSV list (based on checkboxes)
    % ===========================================================
    csvList = { ...
        'Inundated Structures', 'Inundation_Overview.csv', true;
        'Structural Damage States', 'StructDamageState_Overview.csv', ...
            app.StructuralDamageStateCheckBox.Value;
        'Physical Loss Ratio (Repair / Replacement)', 'LossRatio_Overview.csv', ...
            app.LossRatioRepairReplacementCheckBox.Value;
        'Potential Recovery Period of Production Capacity', 'RecoveryPotential_SummaryPage.csv', ...
            app.RecoveryPotentialofProductionCapacityCheckBox.Value;
    };


    % Keep only selected rows
    rowsToPlot = cell2mat(csvList(:,3));
    csvList = csvList(rowsToPlot, :);


    % ===========================================================
    % Loop through selected tables
    % ===========================================================
    for ii = 1:size(csvList,1)

        headingText = csvList{ii,1};
        csvFilename = csvList{ii,2};

        csvPath = fullfile(app.FullDirectory, csvFilename);


        % =========================
        % File existence check
        % =========================
        if exist(csvPath, 'file') ~= 2

            warnPara = Paragraph( ...
                sprintf('File not found: %s (skipped)', csvFilename));

            warnPara.Color  = 'red';
            warnPara.HAlign = 'center';

            append(pdfDoc, warnPara);
            append(pdfDoc, Paragraph(' '));

            continue;
        end


        % =========================
        % Table heading
        % =========================
        hdr = Text(headingText);
        hdr.FontSize = '12pt';
        hdr.Bold = true;

        hdrPara = Paragraph(hdr);
        hdrPara.HAlign = 'center';

        append(pdfDoc, hdrPara);
        append(pdfDoc, Paragraph(' '));


        % =========================
        % Read table safely
        % =========================
        try
            opts = detectImportOptions(csvPath, 'Delimiter', ',');
            opts.VariableNamingRule = 'preserve';

            T = readtable(csvPath, opts);

        catch ME

            errPara = Paragraph( ...
                sprintf('Failed to read %s:\n%s', csvFilename, ME.message));

            errPara.Color = 'red';

            append(pdfDoc, errPara);
            append(pdfDoc, Paragraph(' '));

            try
                uialert(app.RAFTPortsUIFigure, ...
                    sprintf('Failed to load %s:\n%s', csvFilename, ME.message), ...
                    'File Error');
            catch
                fprintf('Failed to load %s: %s\n', csvFilename, ME.message);
            end

            continue;
        end


        % ===========================================================
        % Render DOM table
        % ===========================================================
        domTable = Table();
        domTable.TableEntriesStyle = { ...
            InnerMargin('2pt','2pt','2pt','2pt')};

        domTable.Border = 'solid';
        domTable.ColSep = 'solid';
        domTable.RowSep = 'solid';
        domTable.HAlign = 'center';


        % =========================
        % Header row
        % =========================
        headers = string(T.Properties.VariableNames);

        headerRow = TableRow();

        for h = 1:numel(headers)

            prettyHeader = strrep(char(headers(h)), '_', ' ');

            txt = Text([' ' prettyHeader ' ']);
            txt.Bold = true;
            txt.FontSize = '10pt';

            entry = TableEntry();
            entry.Style = {HAlign('center')};

            append(entry, txt);
            append(headerRow, entry);

        end

        append(domTable, headerRow);


        % =========================
        % Data rows
        % =========================
        for r = 1:height(T)

            row = TableRow();

            for c = 1:width(T)

                v = T{r,c};

                % --- Robust conversion ---
                if any(ismissing(v), 'all') || (ischar(v) && isempty(v))
                    cellStr = '';

                elseif ischar(v) || isstring(v) || iscategorical(v) || ...
                       isdatetime(v) || isduration(v)

                    s = string(v);
                    if ~isscalar(s), s = s(1); end
                    cellStr = char(s);

                elseif isnumeric(v)

                    if isscalar(v) && isfinite(v)

                        if abs(v - round(v)) < 1e-12
                            cellStr = sprintf('%d', round(v));
                        else
                            cellStr = sprintf('%.6g', v);
                        end

                    else
                        vf = v(isfinite(v));

                        if isempty(vf)
                            cellStr = '';
                        else
                            x = vf(1);
                            if abs(x - round(x)) < 1e-12
                                cellStr = sprintf('%d', round(x));
                            else
                                cellStr = sprintf('%.6g', x);
                            end
                        end
                    end

                else
                    s = string(v);
                    if ~isscalar(s), s = s(1); end
                    cellStr = char(s);
                end


                td = TableEntry();
                td.Style = {HAlign('center')};

                append(td, Text(cellStr));
                append(row, td);

            end

            append(domTable, row);

        end


        % Append table
        append(pdfDoc, domTable);
        append(pdfDoc, Paragraph(' '));

    end

end

% ===========================================================
% Inundation Section
% ===========================================================
function step = addInundationSection(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Progress update
    % ===========================================================
    d.Message = 'Processing inundation results...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;


    % ===========================================================
    % Map
    % ===========================================================
    app.addImage(pdfDoc, ...
        fullfile(app.FullDirectory, 'Map_Inundation.png'));

    app.addPageBreak(pdfDoc);


    % ===========================================================
    % Bar Plot
    % ===========================================================
    mapPath =  fullfile(app.FullDirectory, 'BarPlot_inundation.png');

    if exist(mapPath, 'file') == 2

        img = Image(mapPath);

        %Resize the image
        img.Width  = '14cm';
        img.Height = [];   % preserve aspect ratio

        pImg = Paragraph();
        pImg.HAlign = 'center';

        append(pImg, img);
        append(pdfDoc, pImg);

        append(pdfDoc, Paragraph(' '));
    end

    % ===========================================================
    % Table (UPDATED FORMAT)
    % ===========================================================
    csvPath = fullfile(app.FullDirectory, ...
        'InundationDetailedCount.csv');

    % USE YOUR ORIGINAL FORMATTING FUNCTION HERE
    app.addFormattedCSVTable(pdfDoc, csvPath);


    % ===========================================================
    % Page Break
    % ===========================================================
%     app.addPageBreak(pdfDoc);

end

function step = addStructuralDamageSection(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Progress update
    % ===========================================================
    d.Message = 'Processing structural damage...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;


    % ===========================================================
    % 1. SUMMARY BAR PLOT
    % ===========================================================
    imgPath = fullfile(app.FullDirectory, ...
        'BarPlot_StructuralDamageState.png');


    if exist(imgPath, 'file') == 2

        img = Image(imgPath);

        %Resize the image
        img.Width  = '14cm';
        img.Height = [];   % preserve aspect ratio

        pImg = Paragraph();
        pImg.HAlign = 'center';

        append(pImg, img);
        append(pdfDoc, pImg);

    end

    append(pdfDoc, Paragraph(' '));


    % ===========================================================
    % 2. SUMMARY TABLE (Depth vs SDS total)
    % ===========================================================
    csvPath = fullfile(app.FullDirectory, ...
        'StructDamageState_Overview_CountPerDepth.csv');

    app.addFormattedCSVTable(pdfDoc, csvPath);

    app.addPageBreak(pdfDoc);


    % ===========================================================
    % 3. MAPS + DETAILED RESULTS PER DAMAGE STATE
    % ===========================================================
    damageStates = {'Structural_Minor_Damage', ...
                    'Structural_Moderate_Damage', ...
                    'Structural_Major_Damage', ...
                    'Structural_Complete_Destruction'};

    damageDescription = {'Minor Damage', ...
                         'Moderate Damage', ...
                         'Major Damage', ...
                         'Complete Destruction'};

    damageLabels = {'minor', 'moderate', 'major', 'destroyed'};

    Prob_Percent = app.ProbabilityThreshold.Value * 100;

    Summary_ProbExc = app.Summary_ProbExc;

    damageTotals = { ...
        sum(Summary_ProbExc(:,1)), ...
        sum(Summary_ProbExc(:,2)), ...
        sum(Summary_ProbExc(:,3)), ...
        sum(Summary_ProbExc(:,4)) };


    % ===========================================================
    % LOOP THROUGH DAMAGE STATES
    % ===========================================================
    for s = 1:numel(damageStates)

        stateName = damageStates{s};
        stateName2 = damageLabels{s};
        descName = damageDescription{s};
        numstructures = damageTotals{s};

        % ============================
        % Skip empty states
        % ============================
        if numstructures == 0
            continue;
        end


      

        % =======================================================
        % MAP (with your scaling logic)
        % =======================================================
        app.addImage(pdfDoc, fullfile(app.FullDirectory, ...
            ['Map_', stateName, '.png']));

        append(pdfDoc, Paragraph(' '));

        % =======================================================
        % Description text
        % =======================================================
        wordStruct = "structures";

        if numstructures == 1
            wordStruct = "structure";
        end

        msg = sprintf( ...
            'A total of %d %s have a probability of exceedance ≥ %.0f%% for the selected damage state.', ...
            numstructures, wordStruct, Prob_Percent);

        t = Text(char(string(msg)));
        t.FontSize = '12pt';

        p = Paragraph(t);
        p.HAlign = 'center';

        append(pdfDoc, Paragraph(' '));
        append(pdfDoc, p);

        % =======================================================
        % BAR PLOT (type classified)
        % =======================================================
        plotPath = fullfile(app.FullDirectory, ...
            ['BarPlot_', stateName2, '_TypeClassified.png']);

        if exist(plotPath, 'file') == 2

            img = Image(plotPath);

            %Resize the image
            img.Width  = '14cm';
            img.Height = [];   % preserve aspect ratio

            pImg = Paragraph();
            pImg.HAlign = 'center';

            append(pImg, img);
            append(pdfDoc, pImg);

        end

        append(pdfDoc, Paragraph(' '));

        % =======================================================
        % TABLE (per depth breakdown)
        % =======================================================
        tableName = sprintf( ...
            'StructDamageState_%s_CountperDepth.csv', stateName2);

        tablePath = fullfile(app.FullDirectory, tableName);

        app.addFormattedCSVTable(pdfDoc, tablePath);


        % =======================================================
        % Page break
        % =======================================================
%         if s ~= numel(damageStates)
%             app.addPageBreak(pdfDoc);
%         end

    end

end

function step = addLossRatioSection(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Progress update
    % ===========================================================
    d.Message = 'Processing loss ratio...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;

    % ===========================================================
    % Variables
    % ===========================================================
    Prob_Percent = app.ProbabilityThreshold.Value * 100;

    structuresLossRatio = app.Summary_LossRatio;
    numstructuresLR = sum(structuresLossRatio(:));

    % ===========================================================
    % MAP
    % ===========================================================
    app.addImage(pdfDoc, fullfile(app.FullDirectory, 'Map_LossRatio.png'));


    append(pdfDoc, Paragraph(' '));

    % =======================================================
    % DESCRIPTION TEXT
    % =======================================================
    wordStruct = "structures";

    if numstructuresLR == 1
        wordStruct = "structure";
    end

    msg = sprintf( ...
        'A total of %d %s have an with loss ratio of ≥ %.0f%%.', ...
        numstructuresLR, wordStruct, Prob_Percent);
    
    txt2 = Text(msg);

    txt2.FontSize = '12pt';

    p2 = Paragraph(txt2);
    p2.HAlign = 'center';

    append(pdfDoc, p2);
    append(pdfDoc, Paragraph(' '));

    % ===========================================================
    % BAR PLOT
    % ===========================================================
    imgPath = fullfile(app.FullDirectory, 'BarPlot_LossRatio.png');

    if exist(imgPath, 'file') == 2

        img = Image(imgPath);

        %Resize the image
        img.Width  = '14cm';
        img.Height = [];   % preserve aspect ratio

        pImg = Paragraph();
        pImg.HAlign = 'center';

        append(pImg, img);
        append(pdfDoc, pImg);
        append(pdfDoc, Paragraph(' '));
    end

    % ===========================================================
    % TABLE
    % ===========================================================
    app.addFormattedCSVTable(pdfDoc, ...
        fullfile(app.FullDirectory, ...
        'LossRatio_DetailedIndustry_CountPerDepth.csv'));

    % ===========================================================
    % PAGE BREAK
    % ===========================================================
    app.addPageBreak(pdfDoc);

end

function step = addRecoverySection(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Progress update
    % ===========================================================
    d.Message = 'Processing recovery analysis...';
    step = step + 1;
    d.Value = step / totalSteps;
    drawnow;


    % ===========================================================
    % MAP LOOP (months 1–9)
    % ===========================================================
    structuresReco = app.Summary_RecoveryPotential;
    Prob_Percent  = app.ProbabilityThreshold.Value * 100;

    for m = 1:20

        numstructuresReco = sum(structuresReco(:,m));

        % Skip empty bins
        if numstructuresReco == 0
            continue;
        end


        % =======================================================
        % Description text
        % =======================================================


        txt2 = Text(char(string(sprintf( ...
            ['A total of %d structures have a probability of exceedance ≥ %.0f%% ' ...
            'for the selected recovery period.'], ...
            numstructuresReco, ...
            Prob_Percent))));
        txt2.FontSize = '12pt';
        p2 = Paragraph(txt2); p2.HAlign = 'center';


        % =======================================================
        % Load map
        % =======================================================
        startMonth = (m-1)*0.5;
        endMonth   = m*0.5;

        startStr = strrep(num2str(startMonth,'%g'),'.','p');
        endStr   = strrep(num2str(endMonth,'%g'),'.','p');
        % 
        app.addImage(pdfDoc,fullfile(app.FullDirectory, ...
            sprintf('Map_RecoveryPotential_%sto%smos.png', ...
            startStr,endStr)));
        append(pdfDoc, Paragraph(' '));
        append(pdfDoc, p2);

        app.addPageBreak(pdfDoc);

    end


    % ===========================================================
    % BAR PLOT
    % ===========================================================
    plotPath = fullfile(app.FullDirectory, ...
        'BarPlot_RecoveryPotential.png');

    if exist(plotPath, 'file') == 2

        img = Image(plotPath);

        %Resize the image
        img.Width  = '14cm';
        img.Height = [];   % preserve aspect ratio

        pImg = Paragraph();
        pImg.HAlign = 'center';

        append(pImg, img);
        append(pdfDoc, pImg);
          app.addPageBreak(pdfDoc);

    end



    % ===========================================================
    % TABLE (your original custom version)
    % ===========================================================
    tableFile = fullfile(app.FullDirectory, ...
        'RecoveryPotential_CountPerDepth_3DepthDivisions.csv');

    if exist(tableFile, 'file') == 2

        opts = detectImportOptions(tableFile, 'Delimiter', ',');
        opts.VariableNamingRule = 'preserve';

        if isprop(opts, 'TextType')
            opts.TextType = 'string';
        end

        T = readtable(tableFile, opts);

        % Ensure 5 columns
        headers = string(T.Properties.VariableNames);

        if numel(headers) > 5
            headers = headers(1:5);
            T = T(:,1:5);

        elseif numel(headers) < 5
            nMissing = 5 - numel(headers);
            for k = 1:nMissing
                newName = "Col" + string(numel(headers)+k);
                T.(newName) = strings(height(T),1);
                headers(end+1) = newName;
            end
        end

        % Override headers
        headers(2) = "Total Count";
        headers(3) = "At 0 m";
        headers(4) = "At ≤3m";
        headers(5) = "At >3m";


        % =======================================================
        % Create table
        % =======================================================
        pdfTable = Table();
        pdfTable.TableEntriesStyle = {InnerMargin('2pt','2pt')};
        pdfTable.Border = 'solid';
        pdfTable.ColSep = 'solid';
        pdfTable.RowSep = 'solid';
        pdfTable.HAlign = 'center';


        % Header row
        headerRow = TableRow();

        for i = 1:numel(headers)
            hdr = char(string(headers(i)));

            txt = Text([' ' hdr ' ']);
            txt.Bold = true;
            txt.FontSize = '10pt';

            e = TableEntry();
            e.Style = {HAlign('center')};

            append(e, txt);
            append(headerRow, e);
        end

        append(pdfTable, headerRow);


        % Data rows
        numCols = numel(headers);

        for r = 1:height(T)

            row = TableRow();

            for c = 1:numCols

                v = T{r,c};

                % Safe conversion
                if ismissing(v)
                    cellStr = '';
                else
                    cellStr = char(string(v));
                end

                e = TableEntry();

                if c == 1
                    e.Style = {HAlign('left')};
                else
                    e.Style = {HAlign('right')};
                end

                append(e, Text(cellStr));
                append(row, e);
            end

            append(pdfTable, row);
        end

        append(pdfDoc, pdfTable);

    end


    % ===========================================================
    % Page break
    % ===========================================================
%     app.addPageBreak(pdfDoc);

end


function step = finalizeReport(app, pdfDoc, d, step, totalSteps)

    import mlreportgen.dom.*

    % ===========================================================
    % Update progress
    % ===========================================================
    d.Message = 'Finalising report...';
    step = step + 1;
    d.Value = 1;
    drawnow;


    % ===========================================================
    % Add final disclaimer text
    % ===========================================================
%     txt = Text('This report is generated automatically.');
%     txt.FontSize = '9pt';
%     txt.Color    = 'darkgray';
% 
%     % Wrap text in paragraph and justify alignment
%     p = Paragraph(txt);
%     p.HAlign = 'justify';
% 
%     append(pdfDoc, p);

end

end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)

        % =======================================================
        %  ADD PATHS (for development mode only)
        % =======================================================
        % Ensures all helper functions are accessible when NOT compiled
        if ~isdeployed
            try
                appPath = fileparts(matlab.desktop.editor.getActiveFilename);
                addpath(genpath(appPath));
            catch
                % Fallback if editor path fails
                addpath(genpath(pwd));
            end
        end


        % =======================================================
        %  CREATE DEFAULT REFERENCE TABLES
        % =======================================================
        [T_SDS1, T_SDS2, T_SDS3, T_SDS4, T_Loss, T_Recovery] = ...
            createDefaultReferenceTables(app);


        % =======================================================
        %  ASSIGN TABLES TO UI COMPONENTS
        % =======================================================
        app = assignDefaultTables(app, ...
            T_SDS1, T_SDS2, T_SDS3, T_SDS4, T_Loss, T_Recovery);


        % =======================================================
        %  ATTACH LIVE TABLE VALIDATION
        % =======================================================
        % This ensures all user edits are checked immediately
        app.attachTableValidators();


        % =======================================================
        %  POSITION UI WINDOW (CENTER SCREEN)
        % =======================================================
        centreUI(app);


        % =======================================================
        %  INITIALISE GLOBAL SETTINGS
        % =======================================================
        % Includes:
        % - Depth settings
        % - Colour settings
        app = initialiseGlobalSettings(app);


        % =======================================================
        %  SETUP HEADER FIELD CALLBACKS
        % =======================================================
        app = setupHeaderCallbacks(app);


        % =======================================================
        %  INITIALISE CORE DATA STRUCTURES
        % =======================================================

        % Stores all output tables
        app.ReferenceTable = struct();

        % Stores polygon/building data
        app.PolyData     = struct([]);
        app.LandPolyData = struct([]);


        % =======================================================
        %  INITIALISE TYPE SYSTEM
        % =======================================================
        [app.typesMaster, app.TypeLegendColors] = initialiseTypes(app);


        % =======================================================
        %  FINAL UI UPDATE
        % =======================================================
        drawnow;


        end

        % Button pushed function: UploadPolygons
        function UploadPolygonsButtonPushed(app, event)


    % --- SELECT FILE ---
    [filename, path] = uigetfile( ...
        {'*.shp','ESRI Shapefile (*.shp)'}, ...
        'Select Polygon Shapefile');

    if isequal(filename,0)
        return;
    end

    fullname = fullfile(path,filename);

    % UPDATE UI
    app.StructureFileEditField.Value = filename;
    app.StructureFileEditField.FontColor = 'k';
    app.StructureFileEditField.BackgroundColor = 'w';

    % --- READ SHAPEFILE ---
    try

        PolyData = shaperead(fullname);

        % =====================================================
        % CHECK 1 - EMPTY
        % =====================================================
        if isempty(PolyData)
            error('PolygonCheck:Empty', ...
                'Shapefile is empty.');
        end

        % =====================================================
        % CHECK 2 - GEOMETRY TYPE
        % =====================================================
        geoms = string({PolyData.Geometry});

        validGeom = strcmpi(geoms,'polygon') | ...
                    strcmpi(geoms,'multipolygon');

        if ~all(validGeom)
            error('PolyCheck:NonPolygon', ...
                'Shapefile must contain only polygon geometries.');
        end

        % =====================================================
        % CHECK 3 - REQUIRED FIELD "type"
        % =====================================================
        fieldNames = fieldnames(PolyData);

        idxType = find(strcmpi(fieldNames,'type'),1);

        if isempty(idxType)

            uialert(app.RAFTPortsUIFigure, ...
                'It must contain a field named "type".', ...
                'Error Loading Shapefile', ...
                'Icon','error');

            app.StructureFileEditField.Value = '';
            app.PolyData = [];
            return;

        end

        realName = fieldNames{idxType};

        % Standardise field name to "type"
        if ~strcmp(realName,'type')

            for k = 1:numel(PolyData)
                PolyData(k).type = PolyData(k).(realName);
            end

        end

        % =====================================================
        % CHECK 4 - VALIDATE COORDINATES
        % IMPORTANT:
        % Preserve original X/Y arrays exactly.
        % Do NOT remove NaNs.
        % =====================================================
        validMask = false(numel(PolyData),1);

        for k = 1:numel(PolyData)

            if ~isfield(PolyData(k),'X') || ...
               ~isfield(PolyData(k),'Y')
                continue;
            end

            X = PolyData(k).X;
            Y = PolyData(k).Y;

            if ~isnumeric(X) || ~isnumeric(Y)
                continue;
            end

            finiteVertices = sum(isfinite(X) & isfinite(Y));

            if finiteVertices < 3
                continue;
            end

            % KEEP ORIGINAL GEOMETRY
            validMask(k) = true;

        end

        % =====================================================
        % KEEP ONLY VALID FEATURES
        % =====================================================
        PolyData = PolyData(validMask);

        if isempty(PolyData)
            error('PolygonCheck:InvalidGeometry', ...
                'No valid polygons found in shapefile.');
        end

        % =====================================================
        % STANDARDISE TYPE FIELD
        % =====================================================
        for k = 1:numel(PolyData)

            if ischar(PolyData(k).type) || ...
               isstring(PolyData(k).type)

                PolyData(k).type = ...
                    strtrim(string(PolyData(k).type));

            end

        end

        % =====================================================
        % FINAL ASSIGNMENT
        % =====================================================
        app.PolyData = PolyData;

    catch ME

        if strcmp(ME.identifier,'PolyCheck:NonPolygon')

            msg = 'Shapefile must only contain polygon geometries.';

        elseif strcmp(ME.identifier,'PolygonCheck:Empty')

            msg = 'The shapefile is empty.';

        elseif strcmp(ME.identifier,'PolygonCheck:InvalidGeometry')

            msg = 'No valid polygons found.';

        elseif strcmp(ME.identifier,'PolygonCheck:MissingTypeField')

            msg = 'Shapefile must contain a field named "type".';

        else

            msg = sprintf( ...
                'Failed to load shapefile:\n%s', ...
                ME.message);

        end

        uialert(app.RAFTPortsUIFigure, ...
            msg, ...
            'Error Loading Shapefile', ...
            'Icon','error');

        app.StructureFileEditField.Value = '';
        app.PolyData = [];

        return;

    end



        end

        % Button pushed function: OutputDirectoryButton
        function OutputDirectoryButtonPushed(app, event)
            % Set up the directory path for saving the files
            Dir = uigetdir;

            if isequal(Dir, 0)
                % User cancelled
                return;
            else
                % Ensure the directory path is a string
                workDir = string(deblank(Dir));

                % Define the output directory path
                outputDir = fullfile(workDir, 'OUTPUT_REPORT');
                app.WorkDirectoryUserSet = outputDir;

                % Update the OutputDirectoryEditField
                app.DirectoryEditField.Value = outputDir;
                app.DirectoryEditField.FontColor = 'k';

                % Create the output directory if it doesn't exist
                if ~exist(outputDir, 'dir')
                    mkdir(outputDir);
                end
            end

        end

        % Callback function
        function TypeDropDownValueChanged(app, event)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FILTER SDS TABLE BASED ON SELECTED INDUSTRY TYPE %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTANT:
% - Uses CURRENT table data (preserves user edits)
% - Does NOT rely on OriginalTables (removed)
% - Compatible with validation logic

% Get selected industry
selectedType = strtrim(string(app.TypeDropDown.Value));

%% --- Identify active damage state table ---

if app.StrucDamageList.SelectedTab == app.MinorTab

    tbl = app.Table_MinorSDS;

elseif app.StrucDamageList.SelectedTab == app.ModerateTab

    tbl = app.Table_ModerateSDS;

elseif app.StrucDamageList.SelectedTab == app.MajorTab

    tbl = app.Table_MajorSDS;

elseif app.StrucDamageList.SelectedTab == app.DestroyedTab

    tbl = app.Table_DestroyedSDS;

else
    return;
end

%% --- GET CURRENT TABLE DATA (CRITICAL FIX) ---

if istable(tbl.Data)

    dataFull = tbl.Data;
    varNames = dataFull.Properties.VariableNames;

else
    % Convert if stored as cell array
    varNames = tbl.ColumnName;
    dataFull = cell2table(tbl.Data, 'VariableNames', varNames);
end

%% --- IDENTIFY DEPTH COLUMN ---

depthCol = varNames{1};

%% --- FIND SELECTED INDUSTRY COLUMN ---

idx = find(strcmpi(varNames, selectedType), 1);

if isempty(idx)
    warning('Selected type "%s" not found in table.', selectedType);
    return;
end

%% --- BUILD FILTERED TABLE (Depth + selected column) ---

varsToKeep = {depthCol, varNames{idx}};

filteredTable = dataFull(:, varsToKeep);

%% --- APPLY FILTER TO UI TABLE ---

tbl.Data = filteredTable;
tbl.ColumnName = varsToKeep;

drawnow;




        end

        % Callback function
        function EditCheckBoxValueChanged(app, event)
            value = app.EditCheckBox.Value;
            if value && strcmp( app.TypeDropDown.Value,'cargo')
                app.StrucDamage_DS1_cargo_type.Visible = "on";
            else
                app.StrucDamage_DS1_cargo_type.Visible = "off";
            end
        end

        % Value changed function: EastEditField
        function EastEditFieldValueChanged(app, event)
            drawnow
            
        end

        % Value changed function: SouthEditField
        function SouthEditFieldValueChanged(app, event)
            
            drawnow
        end

        % Value changed function: NorthEditField
        function NorthEditFieldValueChanged(app, event)
          drawnow
        end

        % Value changed function: WestEditField
        function WestEditFieldValueChanged(app, event)
            drawnow
        end

        % Callback function
        function MapLayoutDropdownListValueChanged(app, event)
            value = app.MapLayoutDropdownList.Value;

            if strcmp(value,'General Layout')
                app.MapLayoutOptionTabs.SelectedTab = app.GeneralLayoutEditTab;
            elseif  strcmp(value,'Inundation Map')
                app.MapLayoutOptionTabs.SelectedTab = app.InundationMapEditTab;
            elseif  strcmp(value,'Probability Map')
                app.MapLayoutOptionTabs.SelectedTab = app.SDSProbabiltyMapEditTab;
            end

        end

        % Callback function
        function NonstructuralDamageStateCheckBoxValueChanged(app, event)
            value = app.NonstructuralDamageStateCheckBox.Value;
            if value
                app.IncludeupperlowerlimitsCheckBox.Enable = "on";
            else
                app.IncludeupperlowerlimitsCheckBox.Enable = "off";
            end
        end

        % Callback function
        function EditTypeNamesCheckBoxValueChanged(app, event)
           
               app.FragilityCurveMainTabs.SelectedTab = app.EditTypeTab;
     

        end

        % Callback function
        function ButtonValueChanged(app, event)
          
                  app.FragilityCurveMainTabs.SelectedTab = app.EditTypeTab;
        end

        % Value changed function: months_Edit
        function months_EditValueChanged(app, event)
            app.updateRecoveryHeaders();
        end

        % Value changed function: Depth_Edit
        function Depth_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: NoInundation_Edit
        function NoInundation_EditValueChanged(app, event)
            app.updateRecoveryHeaders();
        end

        % Value changed function: DepthLess_Edit
        function DepthLess_EditValueChanged(app, event)
           app.updateRecoveryHeaders();
        end

        % Value changed function: DepthMore_Edit
        function DepthMore_EditValueChanged(app, event)
            app.updateRecoveryHeaders();
        end

        % Value changed function: cargo_Edit
        function cargo_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: chemical_Edit
        function chemical_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: construction_Edit
        function construction_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: energy_Edit
        function energy_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: food_Edit
        function food_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: manufacturing_Edit
        function manufacturing_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: petrochemical_Edit
        function petrochemical_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: transportation_Edit
        function transportation_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: warehouse_Edit
        function warehouse_EditValueChanged(app, event)
            app.updateIndustryHeaders();
        end

        % Value changed function: Colorbar_Min
        function Colorbar_MinValueChanged(app, event)
            value = app.Colorbar_Min.Value;

            % =======================================================
            % Update default colorbar limits
            % =======================================================
            if value >= app.Colorbar_Max.Value
                uialert(app.RAFTPortsUIFigure, ...
                    ['The input value must be less than the maximum value.' ...
                    newline newline ...
                    'The value has been reset.'], ...
                    'Invalid Colorbar Range', ...
                    'Icon','warning');
            else
                    app.Colorbar_Min.Value = 0;
          
                drawnow;
            end
        end

        % Value changed function: Colorbar_Max
        function Colorbar_MaxValueChanged(app, event)
            value = app.Colorbar_Max.Value;
            if value <= app.Colorbar_Min.Value

                uialert(app.RAFTPortsUIFigure, ...
                    ['The input value must be less than the maximum value.' ...
                    newline newline ...
                    'The value has been reset.'], ...
                    'Invalid Colorbar Range', ...
                    'Icon','warning');


                if ~isempty(app.InundationData)
                    cmax = max(app.InundationData(:),[],'omitnan');
                    app.Colorbar_Max.Value = cmax;

                else
                    app.Colorbar_Max.Value = 10;
                end
                drawnow;

            end
        end

        % Value changed function: FragilityCurveDropdownList
        function FragilityCurveDropdownListValueChanged(app, event)
            value = app.FragilityCurveDropdownList.Value;

            if strcmp(value,'Structural Damage State')
                app.FragilityCurveMainTabs.SelectedTab = app.StructuralDamageTab;
            elseif strcmp(value,'Recovery Potential')
                app.FragilityCurveMainTabs.SelectedTab = app.RecoveryPotentialTab;
            elseif strcmp(value,'Loss Ratio (Repair / Replacement)')
                app.FragilityCurveMainTabs.SelectedTab = app.LossTab;
            end

        end

        % Button pushed function: GenerateReportButton
        function GenerateReportButtonPushed(app, event)
            
%%  STEP 0) VALIDATE INPUTS

   delete(findall(0,'Type','figure','Tag','AutoCloseFigure'));


val1 = strtrim(string(app.InundationFileEditField.Value));
val2 = strtrim(string(app.StructureFileEditField.Value));

if val1 == "" || val2 == ""
    uialert(app.RAFTPortsUIFigure, ...
        'Please load both inundation and structure files.', ...
        'Missing Input');
    return;
end

%%  PROGRESS DIALOG

d = uiprogressdlg(app.RAFTPortsUIFigure, ...
    'Title','Processing', ...
    'Message','Starting analysis...', ...
    'Indeterminate','on', ...
    'Cancelable','on');

drawnow;

%%  STEP 1) OUTPUT DIRECTORY (UPDATED → DEFAULT TO DESKTOP)
try

    d.Message = "Setting output directory...";
    drawnow; app.checkCancel(d);

    % if isempty(app.DirectoryEditField.Value)
        app = setupOutputDirectory(app);

        %  Update UI field (UI responsibility stays here)
        app.DirectoryEditField.Value = app.FullDirectory;
    % end
catch ME

    if exist('d','var') && isvalid(d)
        close(d);
    end

    showError(app, ME, "Directory setup failed");
    return;
end
%%  STEP 2) PREPROCESSING

try

    d.Message = "Reading raster...";
    drawnow; app.checkCancel(d);


    app = readAndResampleInundation(app);  

    d.Message = "Computing inundation...";
    drawnow; app.checkCancel(d);

    d.Message = "Creating masked raster...";
    drawnow; app.checkCancel(d);
    app = createMaskedRaster(app);         

    d.Message = "Assigning depth groups...";
    drawnow; app.checkCancel(d);
    app = assignDepthGroups(app);       

catch ME

    if exist('d','var') && isvalid(d)
        close(d);
    end

    showError(app, ME, "Preprocessing failed");
    return;

end

%% ===========================================================
%%  STEP 3) VARIABLES
%% Prepare master variables for pipeline
%% ===========================================================
try
    d.Message = "Preparing variables...";
    drawnow; app.checkCancel(d);

    % Get type definitions and colors
    [typesMaster, TypeLegendColors] = initialiseTypes(app);


    if isempty(typesMaster)
        error('typesMaster is empty. Check setupVariables.');
    end

    % Store in app
    app.typesMaster      = typesMaster;
    app.TypeLegendColors = TypeLegendColors;

catch ME
    if exist('d','var') && isvalid(d)
        close(d);
    end
    showError(app, ME, "Variable setup failed");
    return;
end

%% ===========================================================
%%  BUILD INPUTS + RUN PIPELINE (MERGED )
%% ===========================================================

try

    %%  STEP 4 — BUILD INPUTS
    d.Message = "Building inputs...";
    drawnow; app.checkCancel(d);

    inputs = buildInputs(app);

    %%  STEP 5 — RUN PIPELINE
    d.Message = "Running analysis...";
    drawnow; app.checkCancel(d);

    results = runFullAnalysis(inputs);

    app = assignResults(app, results);

catch ME

    %  SAFELY CLOSE PROGRESS DIALOG
    if exist('d','var') && isvalid(d)
        close(d);
    end

    %%  FULL DEBUG OUTPUT
    fprintf('\n❌ ERROR OCCURRED:\n');
    fprintf('%s\n\n', ME.message);

    fprintf('📍 Location:\n');
    for k = 1:numel(ME.stack)
        fprintf(' → %s (line %d)\n', ME.stack(k).name, ME.stack(k).line);
    end
    fprintf('\n');

    %%  BUILD UI MESSAGE
    msg = sprintf('Pipeline failed:\n\n%s\n\nLocation:\n', ME.message);

    for k = 1:numel(ME.stack)
        msg = sprintf('%s → %s (line %d)\n', ...
            msg, ME.stack(k).name, ME.stack(k).line);
    end

    %%  SHOW ERROR
    uialert(app.RAFTPortsUIFigure, msg, 'Analysis Error');

    return;
end

%% ===========================================================
%%  STEP 6) SAVE MASTER POLYDATA FILE
%% ===========================================================
try

    d.Message = "Saving results...";
    drawnow;
    app.checkCancel(d);

    T = struct2table(app.PolyData);

    removeVars = { ...
        'Geometry', ...
        'BoundingBox', ...
        'X', ...
        'Y'};

    removeVars = removeVars( ...
        ismember(removeVars,T.Properties.VariableNames));

    T(:,removeVars) = [];

    writetable(T, ...
        fullfile(app.FullDirectory,'0_Polygon_Masterfile.csv'));

catch ME

    showError(app, ME, "Saving results failed");
    return;

end

%% ===========================================================
%%  STEP 7) BAR PLOTS and MAPS
%% ===========================================================

try

    d.Message = "Generating bar plots...";
    drawnow;

    if isprop(d,'CancelRequested') && d.CancelRequested

        uialert(app.RAFTPortsUIFigure, ...
            'Operation cancelled by user.', ...
            'Cancelled', ...
            'Icon','warning');

    else

        try

            generateBarPlots(app);

        catch ME

            showError(app, ME, ...
                "Bar Plot generation failed");
            return;

        end

    end

catch ME

    showError(app, ME, ...
        "Bar Plot generation failed");
    return;

end

%% ===========================================================
%%  GENERATE MAPS
%% ===========================================================

try

    d.Message = "Generating maps...";
    drawnow;

    app.checkCancel(d);

    createAllMaps(app);

catch ME

    showError(app, ME, ...
        "Map generation failed");
    return;

end

%% ===========================================================
%%  COMPLETE ANALYSIS
%% ===========================================================

d.Message = " Analysis complete!";
pause(0.5);

if exist('d','var')

    try
        if isvalid(d)
            close(d);
        end
    catch
    end

end

close all

%% ===========================================================
%%  CREATE PDF REPORT
%% ===========================================================

try

    app.generatePDFReport();

catch ME

    showError(app, ME, ...
        "PDF report generation failed");

end
        
  

        end

        % Button pushed function: ResettoDefaultValuesButton
        function ResettoDefaultValuesButtonPushed(app, event)
                 
selection = uiconfirm(app.RAFTPortsUIFigure, ...
    'Are you sure you want to reset all tables?', ...
    'Confirm Reset');

if ~strcmp(selection,'OK')
    return;
end

% =======================================================
% Reset all table header edit fields to defaults
% =======================================================

% SDS / Loss Ratio headers
app.Depth_Edit.Value          = 'depth';
app.cargo_Edit.Value          = 'cargo';
app.chemical_Edit.Value       = 'chemical';
app.construction_Edit.Value   = 'construction';
app.food_Edit.Value           = 'food';
app.manufacturing_Edit.Value  = 'manufacturing';
app.petrochemical_Edit.Value  = 'petrochemical';
app.energy_Edit.Value         = 'powerplant';
app.warehouse_Edit.Value      = 'warehouse';
app.transportation_Edit.Value = 'transportation';

% Recovery headers
app.months_Edit.Value       = 'months';
app.NoInundation_Edit.Value = 'No_Inundation';
app.DepthLess_Edit.Value    = 'Less_than_3m';
app.DepthMore_Edit.Value    = 'More_than_3m';

% =======================================================
% Recreate default reference tables
% =======================================================
[T_SDS1, T_SDS2, T_SDS3, T_SDS4, T_Loss, T_Recovery] = ...
    createDefaultReferenceTables(app);

% =======================================================
% Reassign default table data
% =======================================================
app = assignDefaultTables(app, ...
    T_SDS1, T_SDS2, T_SDS3, T_SDS4, ...
    T_Loss, T_Recovery);

% =======================================================
% Reset column headers
% =======================================================
app.updateIndustryHeaders();
app.updateRecoveryHeaders();

% =======================================================
% Reattach validation callbacks
% =======================================================
app.attachTableValidators();

% =======================================================
% Refresh UI
% =======================================================
drawnow;

uialert(app.RAFTPortsUIFigure, ...
    'All reference tables and column headers have been reset to their default values.', ...
    'Reset Complete', ...
    'Icon','success');


        end

        % Button pushed function: EditTableHeadersButton
        function EditTableHeadersButtonPushed(app, event)
            app.FragilityCurveMainTabs.SelectedTab = app.EditTypeTab;
        end

        % Button pushed function: PreviewMapsButton
        function PreviewMapsButtonPushed(app, event)
            delete(findall(0,'Type','figure','Tag','AutoCloseFigure'));

            try

                app = setupOutputDirectory(app);

                %  Update UI field (UI responsibility stays here)
                app.DirectoryEditField.Value = app.FullDirectory;

                if ~isempty(app.PolyData) && isstruct(app.PolyData)
                    createAllMaps(app);
                end
            end

        end

        % Button pushed function: CloseFiguresButton
        function CloseFiguresButtonPushed(app, event)
            close all
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            
%%  VALIDATE INPUT

val1 = strtrim(string(app.InundationFileEditField.Value));

if val1 == ""
    uialert(app.RAFTPortsUIFigure, ...
        'Please load the inundation file.', ...
        'Missing Input');
    return;
end

%%  UPDATE MAP BOUNDARIES (SAFE)

if isempty(app.TIFFnorth) || isempty(app.TIFFsouth) || ...
   isempty(app.TIFFeast)  || isempty(app.TIFFwest)

    uialert(app.RAFTPortsUIFigure, ...
        'Raster bounds not available. Run preprocessing first.', ...
        'Data Missing');
    return;
end

app.NorthEditField.Value = app.TIFFnorth;
app.SouthEditField.Value = app.TIFFsouth;
app.EastEditField.Value  = app.TIFFeast;
app.WestEditField.Value  = app.TIFFwest;

drawnow;
        end

        % Value changed function: InundationColorMap
        function InundationColorMapValueChanged(app, event)
            value = app.InundationColorMap.Value;
            %List of values based on the cbrewer2 colormap
            validValues = {'blue', 'blue - green', 'blue - purple', 'green - blue', ...
                'greens', 'grays', 'oranges', 'orange - red', ...
                'purple - blue', 'purple - blue - green', 'purple - red', ...
                'purples', 'red - purple', 'reds', 'yellow - green', ...
                'yellow - green - blue', 'yellow - orange - brown', ...
                'yellow - orange - red', 'brown - teal', 'pink - light green', ...
                'purple - green', 'purple - orange', 'red - blue', ...
                'red - gray', 'red - yellow - blue', 'red - yellow - green', ...
                'spectral', 'accent', 'dark 2', 'paired', 'pastel 1', ...
                'pastel 2', 'set 1', 'set 2', 'set 3'};

            % If the selected value in the dropdown list is part of the cbrewer2 colormap, enable the color interpolation textbox
            if ismember(value, validValues)
                app.InundationDivisionEditField.Enable = "on";
                % app.DivisionEditFieldLabel.Enable = "on";
            else
                app.InundationDivisionEditField.Enable= "off";
                % app.DivisionEditFieldLabel.Enable = "off";
            end
        end

        % Button pushed function: UploadLandPolygon
        function UploadLandPolygonButtonPushed(app, event)
            % --- Select and load polygon shapefile (keep original variables) ---
            [filename, path] = uigetfile( ...
                {'*.shp', 'ESRI Shapefile (*.shp)'}, ...
                'Select Polygon Shapefile');

            if isequal(filename, 0)
                % User cancelled
                return;
            end

            fullname = fullfile(path, filename);

            % Update UI field
            app.FileEditField.Value = filename;
            app.FileEditField.FontColor = 'k';
            app.FileEditField.BackgroundColor = 'w';


            % --- Read and validate shapefile (polygons-only) ---
            try

                % Attempt to read shapefile
                LandPoly = shaperead(fullname);

                % Check if empty
                if isempty(LandPoly)
                    error('PolygonCheck:Empty', 'Shapefile is empty.');
                end

                % (OPTIONAL BUT RECOMMENDED) Check geometry type
                if isfield(LandPoly, 'Geometry')
                    geomTypes = {LandPoly.Geometry};

                    if ~all(strcmpi(geomTypes, 'Polygon'))
                        error('PolyCheck:NonPolygon', ...
                            'Shapefile must contain only polygons.');
                    end
                end

                % ASSIGN ONLY AFTER ALL CHECKS PASS
                app.LandPolyData = LandPoly;


            catch ME

                if strcmp(ME.identifier, 'PolyCheck:NonPolygon')
                    uialert(app.RAFTPortsUIFigure, ...
                        'Shapefile should only contain polygons.', ...
                        'Invalid Shapefile', 'Icon', 'warning');

                elseif strcmp(ME.identifier, 'PolygonCheck:Empty')
                    uialert(app.RAFTPortsUIFigure, ...
                        'The shapefile is empty.', ...
                        'Invalid Shapefile', 'Icon', 'warning');

                else
                    uialert(app.RAFTPortsUIFigure, ...
                        sprintf('Failed to load shapefile:\n%s', ME.message), ...
                        'Error Loading Shapefile', 'Icon', 'error');
                end

                return;

            end
        

        end

        % Button pushed function: UploadInundation
        function UploadInundationButtonPushed(app, event)

            % =======================================================
            %  File Selection Dialog
            % =======================================================
            [InundationFilename, InundationDirectory] = uigetfile( ...
                {'*.tif;*.tiff', 'GeoTIFF Files (*.tif, *.tiff)'}, ...
                'Select the Inundation GeoTIFF File');


            % =======================================================
            %  Handle User Cancel
            % =======================================================
            if isequal(InundationFilename, 0)
                % User cancelled file selection
                return;

            else
                % ===================================================
                %  Store File Information in App
                % ===================================================
                app.InundationFileEditField.Value = string(InundationFilename);

                app.InundationFullPath = ...
                    string(InundationDirectory) + string(InundationFilename);

                % Reset UI appearance
                app.InundationFileEditField.FontColor = 'k';
                app.InundationFileEditField.BackgroundColor = 'w';


                % ===================================================
                %  Process GeoTIFF File
                % ===================================================
                if contains(app.InundationFullPath, '.tif')

                    % Read raster reference info (no data needed here)
                    [A, R] = readgeoraster(app.InundationFullPath);

                    % Extract coordinate system
                    app.CoordSystemUnit = R.AngleUnit;

                    % Extract boundary coordinates
                    app.TIFFnorth = max(R.LatitudeLimits);
                    app.TIFFsouth = min(R.LatitudeLimits);
                    app.TIFFeast  = max(R.LongitudeLimits);
                    app.TIFFwest  = min(R.LongitudeLimits);

                    % ===============================================
                    %  Update UI Fields
                    % ===============================================
                    app.NorthEditField.Value = app.TIFFnorth;
                    app.SouthEditField.Value = app.TIFFsouth;
                    app.EastEditField.Value  = app.TIFFeast;
                    app.WestEditField.Value  = app.TIFFwest;

                    % =======================================================
                    % Update default colorbar limits
                    % =======================================================

                    A_num = double(A);

                    if ~isempty(A_num) && any(isfinite(A_num(:)))

                        cmin = min(A_num(:), [], 'omitnan');
                        cmax = max(A_num(:), [], 'omitnan');

                        % Ensure scalars
                        cmin = cmin(1);
                        cmax = cmax(1);

                    else

                        cmin = 0;
                        cmax = 1;

                    end

                    app.Colorbar_Max.Value = cmax; 
                      app.Colorbar_Min.Value = cmin;
                    if cmin < 0
                        app.Colorbar_Min.Value = 0;
                        drawnow;
                    end
                end
            end
        end

        % Value changed function: ResampleRasterDropDown
        function ResampleRasterDropDownValueChanged(app, event)
            value = app.ResampleRasterDropDown.Value;

            if value ~= "No"
                app.FactorEditField.Enable = "on";
                app.xLabel_2.Enable = "on";
            else
                app.FactorEditField.Enable = "off";
                app.xLabel_2.Enable = "off";
            end

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create RAFTPortsUIFigure and hide until all components are created
            app.RAFTPortsUIFigure = uifigure('Visible', 'off');
            app.RAFTPortsUIFigure.AutoResizeChildren = 'off';
            app.RAFTPortsUIFigure.Position = [90 90 379 472];
            app.RAFTPortsUIFigure.Name = 'RAFT Ports';
            app.RAFTPortsUIFigure.Icon = fullfile(pathToMLAPP, 'logo_RAFT-Ports.png');
            app.RAFTPortsUIFigure.Resize = 'off';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.RAFTPortsUIFigure);
            app.TabGroup2.Position = [1 -4 379 477];

            % Create GeneralTab
            app.GeneralTab = uitab(app.TabGroup2);
            app.GeneralTab.Title = 'General';

            % Create Analysis
            app.Analysis = uipanel(app.GeneralTab);
            app.Analysis.Position = [14 136 350 92];

            % Create StructuralDamageStateCheckBox
            app.StructuralDamageStateCheckBox = uicheckbox(app.Analysis);
            app.StructuralDamageStateCheckBox.Tooltip = {'Assess the probability of physical damage severity for a structure across four levels: Minor, Moderate, Major, and Destroyed'; ''; 'Default fragility curve values used: Chua et al., (2021)'};
            app.StructuralDamageStateCheckBox.Text = '  Structural Damage State';
            app.StructuralDamageStateCheckBox.FontSize = 13;
            app.StructuralDamageStateCheckBox.Position = [38 56 171 22];
            app.StructuralDamageStateCheckBox.Value = true;

            % Create RecoveryPotentialofProductionCapacityCheckBox
            app.RecoveryPotentialofProductionCapacityCheckBox = uicheckbox(app.Analysis);
            app.RecoveryPotentialofProductionCapacityCheckBox.Tooltip = {'Provides the probability of recovery for each month after the earthquake'; ''; 'Default fragility curve values used: Suppasri et al. (2022)'};
            app.RecoveryPotentialofProductionCapacityCheckBox.Text = '  Recovery Potential of Production Capacity';
            app.RecoveryPotentialofProductionCapacityCheckBox.FontSize = 13;
            app.RecoveryPotentialofProductionCapacityCheckBox.Position = [38 8 276 22];
            app.RecoveryPotentialofProductionCapacityCheckBox.Value = true;

            % Create LossRatioRepairReplacementCheckBox
            app.LossRatioRepairReplacementCheckBox = uicheckbox(app.Analysis);
            app.LossRatioRepairReplacementCheckBox.Tooltip = {'Default fragility curve values used: Miki et al. (2025)'};
            app.LossRatioRepairReplacementCheckBox.Text = '  Loss Ratio (Repair / Replacement)';
            app.LossRatioRepairReplacementCheckBox.FontSize = 13;
            app.LossRatioRepairReplacementCheckBox.Position = [38 32 266 22];
            app.LossRatioRepairReplacementCheckBox.Value = true;

            % Create InputData
            app.InputData = uipanel(app.GeneralTab);
            app.InputData.Position = [14 358 350 76];

            % Create InundationFileEditFieldLabel
            app.InundationFileEditFieldLabel = uilabel(app.InputData);
            app.InundationFileEditFieldLabel.FontSize = 13;
            app.InundationFileEditFieldLabel.Tooltip = {'Import the inundation file'; ''; 'Required format: georeferenced .tif'; ''; 'Assumption: The inundation raster is based on a digital surface model (DSM), so depth values exist within building footprints'};
            app.InundationFileEditFieldLabel.Position = [25 39 94 20];
            app.InundationFileEditFieldLabel.Text = 'Inundation File:';

            % Create InundationFileEditField
            app.InundationFileEditField = uieditfield(app.InputData, 'text');
            app.InundationFileEditField.Editable = 'off';
            app.InundationFileEditField.FontSize = 13;
            app.InundationFileEditField.Placeholder = '.tif';
            app.InundationFileEditField.Position = [130 39 168 18];

            % Create UploadInundation
            app.UploadInundation = uibutton(app.InputData, 'push');
            app.UploadInundation.ButtonPushedFcn = createCallbackFcn(app, @UploadInundationButtonPushed, true);
            app.UploadInundation.Tooltip = {'Import the inundation file'; ''; 'Required format: georeferenced .tif'; ''; 'Assumption: The inundation raster is based on a digital surface model (DSM), so depth values exist within building footprints'};
            app.UploadInundation.Position = [305 38 20 20];
            app.UploadInundation.Text = '...';

            % Create StructureFileEditFieldLabel
            app.StructureFileEditFieldLabel = uilabel(app.InputData);
            app.StructureFileEditFieldLabel.FontSize = 13;
            app.StructureFileEditFieldLabel.Tooltip = {'Import the building shapefile'; ''; 'Format: .shp'; 'Geometry: 2D polygons only  '; 'Attribute table must include a ''type'' column'; ''; 'If your shapefile contains 3D polygons, re‑save it in QGIS:'; 'Right‑click the layer > Export > Save Features As… > in the Geometry section:'; '1. Set ''Geometry type'' to ''Polygon'''; '2. Uncheck ''Include z‑dimension'''};
            app.StructureFileEditFieldLabel.Position = [25 12 90 22];
            app.StructureFileEditFieldLabel.Text = 'Structure File: ';

            % Create StructureFileEditField
            app.StructureFileEditField = uieditfield(app.InputData, 'text');
            app.StructureFileEditField.Editable = 'off';
            app.StructureFileEditField.FontSize = 13;
            app.StructureFileEditField.Tooltip = {'Import the building shapefile'; ''; 'Format: .shp'; 'Geometry: polygons only'; 'Attribute table must include a ''type'' column'};
            app.StructureFileEditField.Placeholder = '.shp (polygons)';
            app.StructureFileEditField.Position = [130 13 168 18];

            % Create UploadPolygons
            app.UploadPolygons = uibutton(app.InputData, 'push');
            app.UploadPolygons.ButtonPushedFcn = createCallbackFcn(app, @UploadPolygonsButtonPushed, true);
            app.UploadPolygons.Tooltip = {'Import the building shapefile'; ''; 'Format: .shp'; 'Geometry: 2D polygons only  '; 'Attribute table must include a ''type'' column'; ''; 'If your shapefile contains 3D polygons, resave it in QGIS:'; 'Right click the layer > Export > Save Features As… > in the Geometry section:'; '1. Set ''Geometry type'' to ''Polygon'''; '2. Uncheck ''Include z‑dimension'''};
            app.UploadPolygons.Position = [305 12 20 20];
            app.UploadPolygons.Text = '...';

            % Create InputDataLabel
            app.InputDataLabel = uilabel(app.GeneralTab);
            app.InputDataLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.InputDataLabel.FontSize = 14;
            app.InputDataLabel.FontWeight = 'bold';
            app.InputDataLabel.FontColor = [0.0314 0.3686 0.6];
            app.InputDataLabel.Tooltip = {''};
            app.InputDataLabel.Position = [22 423 86 20];
            app.InputDataLabel.Text = '  Input Data  ';

            % Create AnalysisLabel
            app.AnalysisLabel = uilabel(app.GeneralTab);
            app.AnalysisLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.AnalysisLabel.FontSize = 14;
            app.AnalysisLabel.FontWeight = 'bold';
            app.AnalysisLabel.FontColor = [0.0314 0.3686 0.6];
            app.AnalysisLabel.Tooltip = {''};
            app.AnalysisLabel.Position = [22 217 74 20];
            app.AnalysisLabel.Text = '  Analysis  ';

            % Create Mode
            app.Mode = uipanel(app.GeneralTab);
            app.Mode.Position = [14 242 350 102];

            % Create ResamplingMethodLabel
            app.ResamplingMethodLabel = uilabel(app.Mode);
            app.ResamplingMethodLabel.FontSize = 13;
            app.ResamplingMethodLabel.Tooltip = {'Resample the inundation file'; ''; 'If the raster is too coarse, there might be no grid points that fall inside the structure, so no depth values will be extracted for that building.'; ''; 'Resampling ensures there are grid points inside the building footprints.'};
            app.ResamplingMethodLabel.Position = [26 67 109 20];
            app.ResamplingMethodLabel.Text = 'Resample Raster:';

            % Create ResampleRasterDropDown
            app.ResampleRasterDropDown = uidropdown(app.Mode);
            app.ResampleRasterDropDown.Items = {'Cubic', 'Linear', 'Nearest', 'No'};
            app.ResampleRasterDropDown.ValueChangedFcn = createCallbackFcn(app, @ResampleRasterDropDownValueChanged, true);
            app.ResampleRasterDropDown.FontSize = 13;
            app.ResampleRasterDropDown.Position = [145 68 115 18];
            app.ResampleRasterDropDown.Value = 'No';

            % Create xLabel_2
            app.xLabel_2 = uilabel(app.Mode);
            app.xLabel_2.Enable = 'off';
            app.xLabel_2.Position = [305 66 25 22];
            app.xLabel_2.Text = 'x';

            % Create FactorEditField
            app.FactorEditField = uieditfield(app.Mode, 'numeric');
            app.FactorEditField.Limits = [0.1 Inf];
            app.FactorEditField.ValueDisplayFormat = '%11.1f';
            app.FactorEditField.FontSize = 13;
            app.FactorEditField.Enable = 'off';
            app.FactorEditField.Tooltip = {'Resampling Factor'; ''; 'A higher value produces a more refined grid'; ''; 'This value is used as a denominator when dividing the original inundation cell size'};
            app.FactorEditField.Position = [267 68 36 18];
            app.FactorEditField.Value = 2;

            % Create DepthValueTypeLabel
            app.DepthValueTypeLabel = uilabel(app.Mode);
            app.DepthValueTypeLabel.FontSize = 13;
            app.DepthValueTypeLabel.Tooltip = {'Select the depth value that will represent the inundation within a building footprint'};
            app.DepthValueTypeLabel.Position = [26 39 87 20];
            app.DepthValueTypeLabel.Text = 'Extract Depth:';

            % Create ExtractDepthDropDown
            app.ExtractDepthDropDown = uidropdown(app.Mode);
            app.ExtractDepthDropDown.Items = {'Minimum', 'Mean', 'Maximum'};
            app.ExtractDepthDropDown.FontSize = 13;
            app.ExtractDepthDropDown.Position = [145 40 115 18];
            app.ExtractDepthDropDown.Value = 'Maximum';

            % Create ProbabilityThresholdLabel
            app.ProbabilityThresholdLabel = uilabel(app.Mode);
            app.ProbabilityThresholdLabel.FontSize = 13;
            app.ProbabilityThresholdLabel.Tooltip = {'Select the probability threshold for displaying results'; ''; 'Only buildings with probability values at or above the selected threshold will be shown in the report'};
            app.ProbabilityThresholdLabel.Position = [26 12 131 20];
            app.ProbabilityThresholdLabel.Text = 'Probability Threshold:';

            % Create ProbabilityThreshold
            app.ProbabilityThreshold = uieditfield(app.Mode, 'numeric');
            app.ProbabilityThreshold.Limits = [0 1];
            app.ProbabilityThreshold.ValueDisplayFormat = '%11.3f';
            app.ProbabilityThreshold.FontSize = 13;
            app.ProbabilityThreshold.Position = [210 13 50 18];
            app.ProbabilityThreshold.Value = 0.7;

            % Create ModeLabel
            app.ModeLabel = uilabel(app.GeneralTab);
            app.ModeLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ModeLabel.FontSize = 14;
            app.ModeLabel.FontWeight = 'bold';
            app.ModeLabel.FontColor = [0.0314 0.3686 0.6];
            app.ModeLabel.Tooltip = {''};
            app.ModeLabel.Position = [22 333 55 20];
            app.ModeLabel.Text = '  Mode  ';

            % Create Output
            app.Output = uipanel(app.GeneralTab);
            app.Output.Position = [14 12 350 109];

            % Create OutputDirectoryLabel
            app.OutputDirectoryLabel = uilabel(app.Output);
            app.OutputDirectoryLabel.FontSize = 13;
            app.OutputDirectoryLabel.Tooltip = {'Select the folder where the output report and all raw .csv and .png files will be saved'};
            app.OutputDirectoryLabel.Position = [36 74 61 22];
            app.OutputDirectoryLabel.Text = 'Directory:';

            % Create DirectoryEditField
            app.DirectoryEditField = uieditfield(app.Output, 'text');
            app.DirectoryEditField.Editable = 'off';
            app.DirectoryEditField.FontSize = 13;
            app.DirectoryEditField.Placeholder = 'Default: Desktop';
            app.DirectoryEditField.Position = [114 76 183 18];

            % Create OutputDirectoryButton
            app.OutputDirectoryButton = uibutton(app.Output, 'push');
            app.OutputDirectoryButton.ButtonPushedFcn = createCallbackFcn(app, @OutputDirectoryButtonPushed, true);
            app.OutputDirectoryButton.Tooltip = {'Select the folder where the output report and all raw .csv and .png files will be saved'};
            app.OutputDirectoryButton.Position = [305 75 20 20];
            app.OutputDirectoryButton.Text = '...';

            % Create ReportbyEditField
            app.ReportbyEditField = uieditfield(app.Output, 'text');
            app.ReportbyEditField.FontSize = 13;
            app.ReportbyEditField.Placeholder = 'User 1';
            app.ReportbyEditField.Position = [114 49 101 18];

            % Create ReportbyEditFieldLabel
            app.ReportbyEditFieldLabel = uilabel(app.Output);
            app.ReportbyEditFieldLabel.FontSize = 13;
            app.ReportbyEditFieldLabel.Tooltip = {'Include the name of the person generating the report (optional)'};
            app.ReportbyEditFieldLabel.Position = [37 47 66 22];
            app.ReportbyEditFieldLabel.Text = 'Report By:';

            % Create GenerateReportButton
            app.GenerateReportButton = uibutton(app.Output, 'push');
            app.GenerateReportButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateReportButtonPushed, true);
            app.GenerateReportButton.FontSize = 14;
            app.GenerateReportButton.FontWeight = 'bold';
            app.GenerateReportButton.Position = [23 11 303 25];
            app.GenerateReportButton.Text = 'Generate Report';

            % Create OutputLabel
            app.OutputLabel = uilabel(app.GeneralTab);
            app.OutputLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.OutputLabel.FontSize = 14;
            app.OutputLabel.FontWeight = 'bold';
            app.OutputLabel.FontColor = [0.0314 0.3686 0.6];
            app.OutputLabel.Tooltip = {''};
            app.OutputLabel.Position = [25 110 63 20];
            app.OutputLabel.Text = '  Output  ';

            % Create ModifyValuesTab
            app.ModifyValuesTab = uitab(app.TabGroup2);
            app.ModifyValuesTab.Title = 'Modify Values';

            % Create FragilityCurveMainTabs
            app.FragilityCurveMainTabs = uitabgroup(app.ModifyValuesTab);
            app.FragilityCurveMainTabs.AutoResizeChildren = 'off';
            app.FragilityCurveMainTabs.TabLocation = 'left';
            app.FragilityCurveMainTabs.Position = [-81 45 459 330];

            % Create StructuralDamageTab
            app.StructuralDamageTab = uitab(app.FragilityCurveMainTabs);
            app.StructuralDamageTab.AutoResizeChildren = 'off';
            app.StructuralDamageTab.Title = '> Struc';

            % Create StrucDamageList
            app.StrucDamageList = uitabgroup(app.StructuralDamageTab);
            app.StrucDamageList.AutoResizeChildren = 'off';
            app.StrucDamageList.Position = [3 -3 378 333];

            % Create MinorTab
            app.MinorTab = uitab(app.StrucDamageList);
            app.MinorTab.AutoResizeChildren = 'off';
            app.MinorTab.Tooltip = {'Refers to Damage State 1 (DS1) in Chua et al. (2021)'};
            app.MinorTab.Title = 'Minor';
            app.MinorTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_MinorSDS
            app.Table_MinorSDS = uitable(app.MinorTab);
            app.Table_MinorSDS.BackgroundColor = [1 1 1;0.9412 0.9412 0.9412];
            app.Table_MinorSDS.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_MinorSDS.ColumnWidth = {'fit'};
            app.Table_MinorSDS.RowName = {};
            app.Table_MinorSDS.ColumnEditable = true;
            app.Table_MinorSDS.Multiselect = 'off';
            app.Table_MinorSDS.Position = [11 16 354 281];

            % Create ModerateTab
            app.ModerateTab = uitab(app.StrucDamageList);
            app.ModerateTab.AutoResizeChildren = 'off';
            app.ModerateTab.Tooltip = {'Refers to Damage State 2 (DS2) in Chua et al. (2021).'};
            app.ModerateTab.Title = 'Moderate';
            app.ModerateTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_ModerateSDS
            app.Table_ModerateSDS = uitable(app.ModerateTab);
            app.Table_ModerateSDS.BackgroundColor = [1 1 1;0.9412 0.9412 0.9412];
            app.Table_ModerateSDS.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_ModerateSDS.ColumnWidth = {'fit'};
            app.Table_ModerateSDS.RowName = {};
            app.Table_ModerateSDS.ColumnEditable = true;
            app.Table_ModerateSDS.Multiselect = 'off';
            app.Table_ModerateSDS.Position = [11 16 354 281];

            % Create MajorTab
            app.MajorTab = uitab(app.StrucDamageList);
            app.MajorTab.AutoResizeChildren = 'off';
            app.MajorTab.Tooltip = {'Refers to Damage State 3 (DS3) in Chua et al. (2021).'};
            app.MajorTab.Title = 'Major';
            app.MajorTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_MajorSDS
            app.Table_MajorSDS = uitable(app.MajorTab);
            app.Table_MajorSDS.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_MajorSDS.ColumnWidth = {'fit'};
            app.Table_MajorSDS.RowName = {};
            app.Table_MajorSDS.ColumnEditable = true;
            app.Table_MajorSDS.Multiselect = 'off';
            app.Table_MajorSDS.Position = [11 16 354 281];

            % Create DestroyedTab
            app.DestroyedTab = uitab(app.StrucDamageList);
            app.DestroyedTab.AutoResizeChildren = 'off';
            app.DestroyedTab.Tooltip = {'Refers to Damage State 4 (DS4) in Chua et al. (2021).'};
            app.DestroyedTab.Title = 'Destroyed';
            app.DestroyedTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_DestroyedSDS
            app.Table_DestroyedSDS = uitable(app.DestroyedTab);
            app.Table_DestroyedSDS.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_DestroyedSDS.ColumnWidth = {'fit'};
            app.Table_DestroyedSDS.RowName = {};
            app.Table_DestroyedSDS.ColumnEditable = true;
            app.Table_DestroyedSDS.Multiselect = 'off';
            app.Table_DestroyedSDS.Position = [11 16 354 281];

            % Create LossTab
            app.LossTab = uitab(app.FragilityCurveMainTabs);
            app.LossTab.AutoResizeChildren = 'off';
            app.LossTab.Title = '> Loss';
            app.LossTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_LossRatio
            app.Table_LossRatio = uitable(app.LossTab);
            app.Table_LossRatio.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_LossRatio.RowName = {};
            app.Table_LossRatio.ColumnEditable = true;
            app.Table_LossRatio.Position = [11 25 358 281];

            % Create RecoveryPotentialTab
            app.RecoveryPotentialTab = uitab(app.FragilityCurveMainTabs);
            app.RecoveryPotentialTab.AutoResizeChildren = 'off';
            app.RecoveryPotentialTab.Title = '> Reco';
            app.RecoveryPotentialTab.BackgroundColor = [0.902 0.902 0.902];

            % Create Table_RecoveryPotential
            app.Table_RecoveryPotential = uitable(app.RecoveryPotentialTab);
            app.Table_RecoveryPotential.ColumnName = {''; ''; ''; ''; ''; ''; ''; ''; ''};
            app.Table_RecoveryPotential.RowName = {};
            app.Table_RecoveryPotential.ColumnEditable = true;
            app.Table_RecoveryPotential.Position = [11 25 358 281];

            % Create EditTypeTab
            app.EditTypeTab = uitab(app.FragilityCurveMainTabs);
            app.EditTypeTab.Title = 'Edit Type';

            % Create Headers_SDSandLoss
            app.Headers_SDSandLoss = uipanel(app.EditTypeTab);
            app.Headers_SDSandLoss.Position = [36 124 308 165];

            % Create cargo_Edit
            app.cargo_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.cargo_Edit.ValueChangedFcn = createCallbackFcn(app, @cargo_EditValueChanged, true);
            app.cargo_Edit.FontSize = 13;
            app.cargo_Edit.Placeholder = 'cargo';
            app.cargo_Edit.Position = [36 96 100 20];
            app.cargo_Edit.Value = 'cargo';

            % Create chemical_Edit
            app.chemical_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.chemical_Edit.ValueChangedFcn = createCallbackFcn(app, @chemical_EditValueChanged, true);
            app.chemical_Edit.FontSize = 13;
            app.chemical_Edit.Placeholder = 'chemical';
            app.chemical_Edit.Position = [36 68 100 20];
            app.chemical_Edit.Value = 'chemical';

            % Create construction_Edit
            app.construction_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.construction_Edit.ValueChangedFcn = createCallbackFcn(app, @construction_EditValueChanged, true);
            app.construction_Edit.FontSize = 13;
            app.construction_Edit.Placeholder = 'construction';
            app.construction_Edit.Position = [36 41 100 20];
            app.construction_Edit.Value = 'construction';

            % Create food_Edit
            app.food_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.food_Edit.ValueChangedFcn = createCallbackFcn(app, @food_EditValueChanged, true);
            app.food_Edit.FontSize = 13;
            app.food_Edit.Placeholder = 'food';
            app.food_Edit.Position = [171 124 100 20];
            app.food_Edit.Value = 'food';

            % Create manufacturing_Edit
            app.manufacturing_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.manufacturing_Edit.ValueChangedFcn = createCallbackFcn(app, @manufacturing_EditValueChanged, true);
            app.manufacturing_Edit.FontSize = 13;
            app.manufacturing_Edit.Placeholder = 'manufacturing';
            app.manufacturing_Edit.Position = [171 96 100 20];
            app.manufacturing_Edit.Value = 'manufacturing';

            % Create energy_Edit
            app.energy_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.energy_Edit.ValueChangedFcn = createCallbackFcn(app, @energy_EditValueChanged, true);
            app.energy_Edit.FontSize = 13;
            app.energy_Edit.Placeholder = 'energy';
            app.energy_Edit.Position = [36 14 100 20];
            app.energy_Edit.Value = 'energy';

            % Create warehouse_Edit
            app.warehouse_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.warehouse_Edit.ValueChangedFcn = createCallbackFcn(app, @warehouse_EditValueChanged, true);
            app.warehouse_Edit.FontSize = 13;
            app.warehouse_Edit.Placeholder = 'warehouse';
            app.warehouse_Edit.Position = [171 14 100 20];
            app.warehouse_Edit.Value = 'warehouse';

            % Create Depth_Edit
            app.Depth_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.Depth_Edit.ValueChangedFcn = createCallbackFcn(app, @Depth_EditValueChanged, true);
            app.Depth_Edit.FontSize = 13;
            app.Depth_Edit.Placeholder = 'depth';
            app.Depth_Edit.Position = [36 124 100 20];
            app.Depth_Edit.Value = 'depth';

            % Create transportation_Edit
            app.transportation_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.transportation_Edit.ValueChangedFcn = createCallbackFcn(app, @transportation_EditValueChanged, true);
            app.transportation_Edit.FontSize = 13;
            app.transportation_Edit.Placeholder = 'transportation';
            app.transportation_Edit.Position = [171 41 100 20];
            app.transportation_Edit.Value = 'transportation';

            % Create petrochemical_Edit
            app.petrochemical_Edit = uieditfield(app.Headers_SDSandLoss, 'text');
            app.petrochemical_Edit.ValueChangedFcn = createCallbackFcn(app, @petrochemical_EditValueChanged, true);
            app.petrochemical_Edit.FontSize = 13;
            app.petrochemical_Edit.Placeholder = 'petrochemical';
            app.petrochemical_Edit.Position = [171 68 100 20];
            app.petrochemical_Edit.Value = 'petrochemical';

            % Create ForDamageStateLossRatioLabel
            app.ForDamageStateLossRatioLabel = uilabel(app.EditTypeTab);
            app.ForDamageStateLossRatioLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ForDamageStateLossRatioLabel.HorizontalAlignment = 'center';
            app.ForDamageStateLossRatioLabel.FontSize = 13;
            app.ForDamageStateLossRatioLabel.FontWeight = 'bold';
            app.ForDamageStateLossRatioLabel.FontColor = [0.0314 0.3686 0.6];
            app.ForDamageStateLossRatioLabel.Tooltip = {''};
            app.ForDamageStateLossRatioLabel.Position = [83 277 213 22];
            app.ForDamageStateLossRatioLabel.Text = '  For Damage State & Loss Ratio  ';

            % Create EditTableHeadersLabel
            app.EditTableHeadersLabel = uilabel(app.EditTypeTab);
            app.EditTableHeadersLabel.HorizontalAlignment = 'center';
            app.EditTableHeadersLabel.FontSize = 14;
            app.EditTableHeadersLabel.FontWeight = 'bold';
            app.EditTableHeadersLabel.FontColor = [0.0314 0.3686 0.6];
            app.EditTableHeadersLabel.Tooltip = {''};
            app.EditTableHeadersLabel.Position = [125 298 130 24];
            app.EditTableHeadersLabel.Text = 'Edit Table Headers';

            % Create Headers_RecoveryPotential
            app.Headers_RecoveryPotential = uipanel(app.EditTypeTab);
            app.Headers_RecoveryPotential.Position = [36 15 308 97];

            % Create months_Edit
            app.months_Edit = uieditfield(app.Headers_RecoveryPotential, 'text');
            app.months_Edit.ValueChangedFcn = createCallbackFcn(app, @months_EditValueChanged, true);
            app.months_Edit.FontSize = 13;
            app.months_Edit.Placeholder = 'months';
            app.months_Edit.Position = [79 53 59 20];
            app.months_Edit.Value = 'months';

            % Create NoInundation_Edit
            app.NoInundation_Edit = uieditfield(app.Headers_RecoveryPotential, 'text');
            app.NoInundation_Edit.ValueChangedFcn = createCallbackFcn(app, @NoInundation_EditValueChanged, true);
            app.NoInundation_Edit.FontSize = 13;
            app.NoInundation_Edit.Placeholder = 'No_Inundation';
            app.NoInundation_Edit.Position = [146 53 98 20];
            app.NoInundation_Edit.Value = 'No_Inundation';

            % Create DepthLess_Edit
            app.DepthLess_Edit = uieditfield(app.Headers_RecoveryPotential, 'text');
            app.DepthLess_Edit.ValueChangedFcn = createCallbackFcn(app, @DepthLess_EditValueChanged, true);
            app.DepthLess_Edit.FontSize = 13;
            app.DepthLess_Edit.Placeholder = 'Less_than_3m';
            app.DepthLess_Edit.Position = [15 22 138 20];
            app.DepthLess_Edit.Value = 'Less_than_3m';

            % Create DepthMore_Edit
            app.DepthMore_Edit = uieditfield(app.Headers_RecoveryPotential, 'text');
            app.DepthMore_Edit.ValueChangedFcn = createCallbackFcn(app, @DepthMore_EditValueChanged, true);
            app.DepthMore_Edit.FontSize = 13;
            app.DepthMore_Edit.Placeholder = 'More_than_3m';
            app.DepthMore_Edit.Position = [156 22 138 20];
            app.DepthMore_Edit.Value = 'More_than_3m';

            % Create ForRecoveryPotentialLabel
            app.ForRecoveryPotentialLabel = uilabel(app.EditTypeTab);
            app.ForRecoveryPotentialLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ForRecoveryPotentialLabel.FontSize = 13;
            app.ForRecoveryPotentialLabel.FontWeight = 'bold';
            app.ForRecoveryPotentialLabel.FontColor = [0.0314 0.3686 0.6];
            app.ForRecoveryPotentialLabel.Tooltip = {''};
            app.ForRecoveryPotentialLabel.Position = [109 100 161 22];
            app.ForRecoveryPotentialLabel.Text = '  For Recovery Potential  ';

            % Create FragilityCurveDropdownList
            app.FragilityCurveDropdownList = uidropdown(app.ModifyValuesTab);
            app.FragilityCurveDropdownList.Items = {'Structural Damage State', 'Loss Ratio (Repair / Replacement)', 'Recovery Potential'};
            app.FragilityCurveDropdownList.ValueChangedFcn = createCallbackFcn(app, @FragilityCurveDropdownListValueChanged, true);
            app.FragilityCurveDropdownList.FontSize = 13;
            app.FragilityCurveDropdownList.FontWeight = 'bold';
            app.FragilityCurveDropdownList.Position = [32 400 312 24];
            app.FragilityCurveDropdownList.Value = 'Structural Damage State';

            % Create ViewFragilityCurveValuesforLabel
            app.ViewFragilityCurveValuesforLabel = uilabel(app.ModifyValuesTab);
            app.ViewFragilityCurveValuesforLabel.FontSize = 13;
            app.ViewFragilityCurveValuesforLabel.Tooltip = {'View the table of values used for the analysis'};
            app.ViewFragilityCurveValuesforLabel.Position = [33 425 185 22];
            app.ViewFragilityCurveValuesforLabel.Text = 'View Fragility Curve Values for:';

            % Create EditTableHeadersButton
            app.EditTableHeadersButton = uibutton(app.ModifyValuesTab, 'push');
            app.EditTableHeadersButton.ButtonPushedFcn = createCallbackFcn(app, @EditTableHeadersButtonPushed, true);
            app.EditTableHeadersButton.FontSize = 13;
            app.EditTableHeadersButton.FontWeight = 'bold';
            app.EditTableHeadersButton.Tooltip = {'To change the industry names and other headers'};
            app.EditTableHeadersButton.Position = [213 12 131 26];
            app.EditTableHeadersButton.Text = 'Edit Table Headers';

            % Create NumbersareeditableinthetableLabel
            app.NumbersareeditableinthetableLabel = uilabel(app.ModifyValuesTab);
            app.NumbersareeditableinthetableLabel.WordWrap = 'on';
            app.NumbersareeditableinthetableLabel.FontSize = 11;
            app.NumbersareeditableinthetableLabel.Tooltip = {'Make sure the modified values are in increasing order in each column'};
            app.NumbersareeditableinthetableLabel.Position = [36 374 254 29];
            app.NumbersareeditableinthetableLabel.Text = 'Numbers are editable in the table';

            % Create ResettoDefaultValuesButton
            app.ResettoDefaultValuesButton = uibutton(app.ModifyValuesTab, 'push');
            app.ResettoDefaultValuesButton.ButtonPushedFcn = createCallbackFcn(app, @ResettoDefaultValuesButtonPushed, true);
            app.ResettoDefaultValuesButton.FontSize = 13;
            app.ResettoDefaultValuesButton.FontWeight = 'bold';
            app.ResettoDefaultValuesButton.Position = [30 12 171 26];
            app.ResettoDefaultValuesButton.Text = 'Reset to Default Values';

            % Create ModifyMapsTab
            app.ModifyMapsTab = uitab(app.TabGroup2);
            app.ModifyMapsTab.AutoResizeChildren = 'off';
            app.ModifyMapsTab.Title = 'Modify Maps';

            % Create Polygons
            app.Polygons = uipanel(app.ModifyMapsTab);
            app.Polygons.Position = [20 310 338 128];

            % Create StructuresLabel
            app.StructuresLabel = uilabel(app.Polygons);
            app.StructuresLabel.FontSize = 13;
            app.StructuresLabel.FontWeight = 'bold';
            app.StructuresLabel.Position = [17 93 70 22];
            app.StructuresLabel.Text = 'Structures';

            % Create ColorDropDown_3Label
            app.ColorDropDown_3Label = uilabel(app.Polygons);
            app.ColorDropDown_3Label.WordWrap = 'on';
            app.ColorDropDown_3Label.FontSize = 13;
            app.ColorDropDown_3Label.Tooltip = {'Select the colour applied to buildings with values at or above the chosen threshold (the focus of the results)'};
            app.ColorDropDown_3Label.Position = [19 74 162 22];
            app.ColorDropDown_3Label.Text = 'Within the Threshold Limit:';

            % Create PolygonColorDropdown
            app.PolygonColorDropdown = uidropdown(app.Polygons);
            app.PolygonColorDropdown.Items = {'black', 'grey 1', 'grey 2', 'grey 3', 'grey 4', 'grey 5', 'white 1', 'white 2', 'white 3', 'white 4', 'white 5', 'green', 'yellow', 'cyan', 'magenta', 'red 1', 'red 2', 'red 3', 'red 4', 'red 5', 'blue 1', 'blue 2', 'blue 3', 'blue 4', 'blue 5'};
            app.PolygonColorDropdown.Tooltip = {''};
            app.PolygonColorDropdown.FontSize = 13;
            app.PolygonColorDropdown.Position = [28 55 96 20];
            app.PolygonColorDropdown.Value = 'red 3';

            % Create Unaffected_PolygonColorDropdown_Label
            app.Unaffected_PolygonColorDropdown_Label = uilabel(app.Polygons);
            app.Unaffected_PolygonColorDropdown_Label.WordWrap = 'on';
            app.Unaffected_PolygonColorDropdown_Label.FontSize = 13;
            app.Unaffected_PolygonColorDropdown_Label.Tooltip = {'Select the colour applied to buildings with values below the chosen threshold '};
            app.Unaffected_PolygonColorDropdown_Label.Position = [19 29 128 22];
            app.Unaffected_PolygonColorDropdown_Label.Text = 'Below the Threshold:';

            % Create Unaffected_PolygonColorDropdown
            app.Unaffected_PolygonColorDropdown = uidropdown(app.Polygons);
            app.Unaffected_PolygonColorDropdown.Items = {'black', 'grey 1', 'grey 2', 'grey 3', 'grey 4', 'grey 5', 'white 1', 'white 2', 'white 3', 'white 4', 'white 5', 'green', 'yellow', 'cyan', 'magenta', 'red 1', 'red 2', 'red 3', 'red 4', 'red 5', 'blue 1', 'blue 2', 'blue 3', 'blue 4', 'blue 5'};
            app.Unaffected_PolygonColorDropdown.Tooltip = {''};
            app.Unaffected_PolygonColorDropdown.FontSize = 13;
            app.Unaffected_PolygonColorDropdown.Position = [28 10 96 20];
            app.Unaffected_PolygonColorDropdown.Value = 'white 1';

            % Create LandAreaLabel
            app.LandAreaLabel = uilabel(app.Polygons);
            app.LandAreaLabel.FontSize = 13;
            app.LandAreaLabel.FontWeight = 'bold';
            app.LandAreaLabel.Position = [187 93 68 22];
            app.LandAreaLabel.Text = 'Land Area';

            % Create UploadLandPolygon
            app.UploadLandPolygon = uibutton(app.Polygons, 'push');
            app.UploadLandPolygon.ButtonPushedFcn = createCallbackFcn(app, @UploadLandPolygonButtonPushed, true);
            app.UploadLandPolygon.Tooltip = {'Import a land shapefile to help distinguish land from water (optional)'; ''; 'Format: .shp'; 'Geometry: 2D polygons only  '; ''; 'If your shapefile contains 3D polygons, re‑save it in QGIS:'; 'Right‑click the layer > Export > Save Features As… > in the Geometry section:'; '1. Set ''Geometry type'' to ''Polygon'''; '2. Uncheck ''Include z‑dimension'''};
            app.UploadLandPolygon.Position = [302 55 20 20];
            app.UploadLandPolygon.Text = '...';

            % Create FileEditFieldLabel
            app.FileEditFieldLabel = uilabel(app.Polygons);
            app.FileEditFieldLabel.FontSize = 13;
            app.FileEditFieldLabel.Tooltip = {'Import a land shapefile to help distinguish land from water (optional)'; ''; 'Format: .shp'; 'Geometry: 2D polygons only  '; ''; 'If your shapefile contains 3D polygons, re‑save it in QGIS:'; 'Right‑click the layer > Export > Save Features As… > in the Geometry section:'; '1. Set ''Geometry type'' to ''Polygon'''; '2. Uncheck ''Include z‑dimension'''};
            app.FileEditFieldLabel.Position = [190 74 30 22];
            app.FileEditFieldLabel.Text = 'File:';

            % Create FileEditField
            app.FileEditField = uieditfield(app.Polygons, 'text');
            app.FileEditField.Editable = 'off';
            app.FileEditField.FontSize = 13;
            app.FileEditField.Tooltip = {'Import the building shapefile'; ''; 'Format: .shp'; 'Geometry: polygons only'; 'Attribute table must include a ''type'' column'};
            app.FileEditField.Placeholder = '.shp';
            app.FileEditField.Position = [188 55 106 20];

            % Create Unaffected_PolygonColorDropdown_Label_2
            app.Unaffected_PolygonColorDropdown_Label_2 = uilabel(app.Polygons);
            app.Unaffected_PolygonColorDropdown_Label_2.WordWrap = 'on';
            app.Unaffected_PolygonColorDropdown_Label_2.FontSize = 13;
            app.Unaffected_PolygonColorDropdown_Label_2.Tooltip = {'Select land colour'};
            app.Unaffected_PolygonColorDropdown_Label_2.Position = [190 29 128 22];
            app.Unaffected_PolygonColorDropdown_Label_2.Text = 'Land Colour:';

            % Create LandColourDropDown
            app.LandColourDropDown = uidropdown(app.Polygons);
            app.LandColourDropDown.Items = {'black', 'grey 1', 'grey 2', 'grey 3', 'grey 4', 'grey 5', 'white 1', 'white 2', 'white 3', 'white 4', 'white 5', 'green', 'yellow', 'cyan', 'magenta', 'red 1', 'red 2', 'red 3', 'red 4', 'red 5', 'blue 1', 'blue 2', 'blue 3', 'blue 4', 'blue 5'};
            app.LandColourDropDown.Tooltip = {''};
            app.LandColourDropDown.FontSize = 13;
            app.LandColourDropDown.Position = [188 10 96 20];
            app.LandColourDropDown.Value = 'white 3';

            % Create PolygonsLabel
            app.PolygonsLabel = uilabel(app.ModifyMapsTab);
            app.PolygonsLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.PolygonsLabel.FontSize = 14;
            app.PolygonsLabel.FontWeight = 'bold';
            app.PolygonsLabel.FontColor = [0.0314 0.3686 0.6];
            app.PolygonsLabel.Position = [31 426 76 22];
            app.PolygonsLabel.Text = '  Polygons';

            % Create InundationMap
            app.InundationMap = uipanel(app.ModifyMapsTab);
            app.InundationMap.Position = [20 201 338 98];

            % Create DepthRange
            app.DepthRange = uilabel(app.InundationMap);
            app.DepthRange.WordWrap = 'on';
            app.DepthRange.FontSize = 13;
            app.DepthRange.Tooltip = {'Set the limit of the inundation (and wave height) values to display on the map'};
            app.DepthRange.Position = [31 63 86 22];
            app.DepthRange.Text = 'Depth Range:';

            % Create Colorbar_Min
            app.Colorbar_Min = uieditfield(app.InundationMap, 'numeric');
            app.Colorbar_Min.ValueDisplayFormat = '%8.1f';
            app.Colorbar_Min.ValueChangedFcn = createCallbackFcn(app, @Colorbar_MinValueChanged, true);
            app.Colorbar_Min.FontSize = 13;
            app.Colorbar_Min.Tooltip = {''};
            app.Colorbar_Min.Position = [137 64 42 20];

            % Create Colorbar_Max
            app.Colorbar_Max = uieditfield(app.InundationMap, 'numeric');
            app.Colorbar_Max.Limits = [0.1 Inf];
            app.Colorbar_Max.ValueDisplayFormat = '%.1f';
            app.Colorbar_Max.ValueChangedFcn = createCallbackFcn(app, @Colorbar_MaxValueChanged, true);
            app.Colorbar_Max.FontSize = 13;
            app.Colorbar_Max.Tooltip = {''};
            app.Colorbar_Max.Position = [220 64 42 20];
            app.Colorbar_Max.Value = 10;

            % Create toLabel
            app.toLabel = uilabel(app.InundationMap);
            app.toLabel.FontSize = 13;
            app.toLabel.Position = [193 63 25 22];
            app.toLabel.Text = 'to';

            % Create DepthColours
            app.DepthColours = uilabel(app.InundationMap);
            app.DepthColours.WordWrap = 'on';
            app.DepthColours.FontSize = 13;
            app.DepthColours.Tooltip = {'Select the colour gradient'};
            app.DepthColours.Position = [31 30 102 32];
            app.DepthColours.Text = 'Depth Colours:';

            % Create InundationColorMap
            app.InundationColorMap = uidropdown(app.InundationMap);
            app.InundationColorMap.Items = {'--- MATLAB default ----', 'abyss', 'autumn', 'bone', 'colorcube', 'cool', 'copper', 'flag', 'gray', 'hot', 'hsv', 'jet', 'parula', 'pink', 'prism', 'sky', 'spring', 'summer', 'turbo', 'winter', '---  CBREWER 2 ---', '< sequential >', 'blue', 'blue - green', 'blue - purple', 'green - blue', 'greens', 'grays', 'oranges', 'orange - red', 'purple - blue', 'purple - blue - green', 'purple - red', 'purples', 'red - purple', 'reds', 'yellow - green', 'yellow - green - blue', 'yellow - orange - brown', 'yellow - orange - red', '< divergent >', 'brown - teal', 'pink - light green', 'purple - green', 'purple - orange', 'red - blue', 'red - gray', 'red - yellow - blue', 'red - yellow - green', 'spectral', '< qualitative >', 'accent', 'dark 2', 'paired', 'pastel 1', 'pastel 2', 'set 1', 'set 2', 'set 3'};
            app.InundationColorMap.ValueChangedFcn = createCallbackFcn(app, @InundationColorMapValueChanged, true);
            app.InundationColorMap.Tooltip = {''};
            app.InundationColorMap.FontSize = 13;
            app.InundationColorMap.Position = [137 36 125 20];
            app.InundationColorMap.Value = 'blue';

            % Create ColourDivisionLabel
            app.ColourDivisionLabel = uilabel(app.InundationMap);
            app.ColourDivisionLabel.FontSize = 13;
            app.ColourDivisionLabel.Tooltip = {'Set the number of colourbar divisions'; ''; 'Low value:'; 'Distinct colour boundaries'; ''; 'Higher value:'; 'Smoother colour transition'};
            app.ColourDivisionLabel.Position = [31 7 100 22];
            app.ColourDivisionLabel.Text = 'Colour Division: ';

            % Create InundationDivisionEditField
            app.InundationDivisionEditField = uieditfield(app.InundationMap, 'numeric');
            app.InundationDivisionEditField.Limits = [0 200];
            app.InundationDivisionEditField.ValueDisplayFormat = '%3.0f';
            app.InundationDivisionEditField.FontSize = 13;
            app.InundationDivisionEditField.Tooltip = {''};
            app.InundationDivisionEditField.Position = [137 8 42 20];
            app.InundationDivisionEditField.Value = 20;

            % Create InundationColorbar_Flip
            app.InundationColorbar_Flip = uicheckbox(app.InundationMap);
            app.InundationColorbar_Flip.Tooltip = {'Reverse the color sequence'};
            app.InundationColorbar_Flip.Text = 'Flip';
            app.InundationColorbar_Flip.FontSize = 13;
            app.InundationColorbar_Flip.Position = [272 36 43 20];

            % Create MapBoundary
            app.MapBoundary = uipanel(app.ModifyMapsTab);
            app.MapBoundary.Position = [20 70 338 118];

            % Create NorthEditFieldLabel
            app.NorthEditFieldLabel = uilabel(app.MapBoundary);
            app.NorthEditFieldLabel.HorizontalAlignment = 'right';
            app.NorthEditFieldLabel.FontSize = 13;
            app.NorthEditFieldLabel.Position = [147 93 37 22];
            app.NorthEditFieldLabel.Text = 'North';

            % Create NorthEditField
            app.NorthEditField = uieditfield(app.MapBoundary, 'numeric');
            app.NorthEditField.ValueDisplayFormat = '%8.4f';
            app.NorthEditField.ValueChangedFcn = createCallbackFcn(app, @NorthEditFieldValueChanged, true);
            app.NorthEditField.FontSize = 13;
            app.NorthEditField.Position = [136 72 65 20];

            % Create SouthEditField
            app.SouthEditField = uieditfield(app.MapBoundary, 'numeric');
            app.SouthEditField.ValueDisplayFormat = '%8.4f';
            app.SouthEditField.ValueChangedFcn = createCallbackFcn(app, @SouthEditFieldValueChanged, true);
            app.SouthEditField.FontSize = 13;
            app.SouthEditField.Position = [136 24 65 20];

            % Create NorthEditFieldLabel_2
            app.NorthEditFieldLabel_2 = uilabel(app.MapBoundary);
            app.NorthEditFieldLabel_2.HorizontalAlignment = 'right';
            app.NorthEditFieldLabel_2.FontSize = 13;
            app.NorthEditFieldLabel_2.Position = [147 3 39 22];
            app.NorthEditFieldLabel_2.Text = 'South';

            % Create EastEditFieldLabel
            app.EastEditFieldLabel = uilabel(app.MapBoundary);
            app.EastEditFieldLabel.FontSize = 13;
            app.EastEditFieldLabel.Position = [247 47 32 22];
            app.EastEditFieldLabel.Text = 'East';

            % Create EastEditField
            app.EastEditField = uieditfield(app.MapBoundary, 'numeric');
            app.EastEditField.ValueDisplayFormat = '%8.4f';
            app.EastEditField.ValueChangedFcn = createCallbackFcn(app, @EastEditFieldValueChanged, true);
            app.EastEditField.FontSize = 13;
            app.EastEditField.Position = [178 48 65 20];

            % Create WestEditFieldLabel
            app.WestEditFieldLabel = uilabel(app.MapBoundary);
            app.WestEditFieldLabel.HorizontalAlignment = 'right';
            app.WestEditFieldLabel.FontSize = 13;
            app.WestEditFieldLabel.Position = [58 47 34 22];
            app.WestEditFieldLabel.Text = 'West';

            % Create WestEditField
            app.WestEditField = uieditfield(app.MapBoundary, 'numeric');
            app.WestEditField.ValueDisplayFormat = '%8.4f';
            app.WestEditField.ValueChangedFcn = createCallbackFcn(app, @WestEditFieldValueChanged, true);
            app.WestEditField.FontSize = 13;
            app.WestEditField.Position = [99 48 65 20];

            % Create ResetButton
            app.ResetButton = uibutton(app.MapBoundary, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.FontSize = 13;
            app.ResetButton.Tooltip = {'Use the boundary limits extracted from the inundation raster'};
            app.ResetButton.Position = [232 13 94 23];
            app.ResetButton.Text = 'Reset';

            % Create InundationMapLabel
            app.InundationMapLabel = uilabel(app.ModifyMapsTab);
            app.InundationMapLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.InundationMapLabel.FontSize = 14;
            app.InundationMapLabel.FontWeight = 'bold';
            app.InundationMapLabel.FontColor = [0.0314 0.3686 0.6];
            app.InundationMapLabel.Position = [31 287 120 22];
            app.InundationMapLabel.Text = '  Inundation Map  ';

            % Create InundationBackgroundMapLabel_4
            app.InundationBackgroundMapLabel_4 = uilabel(app.ModifyMapsTab);
            app.InundationBackgroundMapLabel_4.BackgroundColor = [0.9412 0.9412 0.9412];
            app.InundationBackgroundMapLabel_4.WordWrap = 'on';
            app.InundationBackgroundMapLabel_4.FontSize = 14;
            app.InundationBackgroundMapLabel_4.FontWeight = 'bold';
            app.InundationBackgroundMapLabel_4.FontColor = [0.0314 0.3686 0.6];
            app.InundationBackgroundMapLabel_4.Tooltip = {''};
            app.InundationBackgroundMapLabel_4.Position = [32 176 113 22];
            app.InundationBackgroundMapLabel_4.Text = '  Map Boundary  ';

            % Create FigureResolutiondpiLabel
            app.FigureResolutiondpiLabel = uilabel(app.ModifyMapsTab);
            app.FigureResolutiondpiLabel.HorizontalAlignment = 'right';
            app.FigureResolutiondpiLabel.FontSize = 13;
            app.FigureResolutiondpiLabel.FontWeight = 'bold';
            app.FigureResolutiondpiLabel.FontColor = [0.0314 0.3686 0.6];
            app.FigureResolutiondpiLabel.Tooltip = {'Set the figure quality (applies to all figures, including bar plots)'; ''; 'Higher DPI values produce sharper images'};
            app.FigureResolutiondpiLabel.Position = [39 43 152 22];
            app.FigureResolutiondpiLabel.Text = 'Figure Resolution (dpi):';

            % Create FigureResolutiondpiEditField
            app.FigureResolutiondpiEditField = uieditfield(app.ModifyMapsTab, 'numeric');
            app.FigureResolutiondpiEditField.Limits = [1 Inf];
            app.FigureResolutiondpiEditField.ValueDisplayFormat = '%11.0f';
            app.FigureResolutiondpiEditField.FontSize = 13;
            app.FigureResolutiondpiEditField.FontColor = [0.149 0.149 0.149];
            app.FigureResolutiondpiEditField.Tooltip = {''};
            app.FigureResolutiondpiEditField.Position = [197 43 39 20];
            app.FigureResolutiondpiEditField.Value = 150;

            % Create CloseFiguresButton
            app.CloseFiguresButton = uibutton(app.ModifyMapsTab, 'push');
            app.CloseFiguresButton.ButtonPushedFcn = createCallbackFcn(app, @CloseFiguresButtonPushed, true);
            app.CloseFiguresButton.IconAlignment = 'right';
            app.CloseFiguresButton.WordWrap = 'on';
            app.CloseFiguresButton.FontSize = 13;
            app.CloseFiguresButton.Position = [252 42 94 23];
            app.CloseFiguresButton.Text = 'Close Figures';

            % Create PreviewMapsButton
            app.PreviewMapsButton = uibutton(app.ModifyMapsTab, 'push');
            app.PreviewMapsButton.ButtonPushedFcn = createCallbackFcn(app, @PreviewMapsButtonPushed, true);
            app.PreviewMapsButton.FontSize = 14;
            app.PreviewMapsButton.FontWeight = 'bold';
            app.PreviewMapsButton.Position = [118 11 143 25];
            app.PreviewMapsButton.Text = 'Preview Maps';

            % Show the figure after all components are created
            app.RAFTPortsUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = RAFT_Ports_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.RAFTPortsUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.RAFTPortsUIFigure)
        end
    end
end