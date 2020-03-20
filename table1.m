
opts = delimitedTextImportOptions("NumVariables", 19);

% Specify range and delimiter
opts.DataLines = [2, 18913];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["ProductID", "Productcharacteristic1", "QualityCharacteristic8", "QualityCharacteristic1", "QualityCharacteristic2", "QualityCharacteristic3", "QualityCharacteristic4", "QualityCharacteristic5", "QualityCharacteristic6", "ProcessCharacteristic1", "ProcessCharacteristic2", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "ReworkMinutes", "Qualityrating", "CaptureDate", "ReworkDate", "QualityCharacteristic7"];
opts.VariableTypes = ["double", "double", "char", "double", "double", "double", "double", "char", "char", "double", "double", "char", "char", "char", "double", "double", "char", "char", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["QualityCharacteristic8", "QualityCharacteristic5", "QualityCharacteristic6", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "CaptureDate", "ReworkDate"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["QualityCharacteristic8", "QualityCharacteristic5", "QualityCharacteristic6", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "CaptureDate", "ReworkDate"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "ProcessCharacteristic1", "TrimNonNumeric", true);
opts = setvaropts(opts, "ProcessCharacteristic1", "ThousandsSeparator", ",");

% Import the data
bmw1 = readtable("C:\Users\User\Documents\MATLAB\mdm3\bmw1.csv", opts);

data = sortrows(bmw1);
%% Clear temporary variables
clear opts

%Gets rid of 'b's
indices = strcmp(bmw1.Repaircharacteristic1,'b');
bmw1(indices,:) = [];


