opts = delimitedTextImportOptions("NumVariables", 19);


opts.DataLines = [2, Inf];
opts.Delimiter = ",";


opts.VariableNames = ["ProductID", "Productcharacteristic1", "QualityCharacteristic8", "QualityCharacteristic1", "QualityCharacteristic2", "QualityCharacteristic3", "QualityCharacteristic4", "QualityCharacteristic5", "QualityCharacteristic6", "ProcessCharacteristic1", "ProcessCharacteristic2", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "ReworkMinutes", "Qualityrating", "CaptureDate", "ReworkDate", "QualityCharacteristic7"];
opts.VariableTypes = ["double", "double", "categorical", "double", "double", "double", "double", "categorical", "categorical", "double", "double", "categorical", "categorical", "categorical", "double", "double", "string", "string", "double"];


opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";


opts = setvaropts(opts, ["CaptureDate", "ReworkDate"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["QualityCharacteristic8", "QualityCharacteristic5", "QualityCharacteristic6", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "CaptureDate", "ReworkDate"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "ProcessCharacteristic1", "TrimNonNumeric", true);
opts = setvaropts(opts, "ProcessCharacteristic1", "ThousandsSeparator", ",");


tbl = readtable("C:\Users\User\Documents\MATLAB\mdm3\bmw1.csv", opts);

%% Convert to output type
ProductID = tbl.ProductID;
Productcharacteristic1 = tbl.Productcharacteristic1;
QualityCharacteristic8 = tbl.QualityCharacteristic8;
QualityCharacteristic1 = tbl.QualityCharacteristic1;
QualityCharacteristic2 = tbl.QualityCharacteristic2;
QualityCharacteristic3 = tbl.QualityCharacteristic3;
QualityCharacteristic4 = tbl.QualityCharacteristic4;
QualityCharacteristic5 = tbl.QualityCharacteristic5;
QualityCharacteristic6 = tbl.QualityCharacteristic6;
ProcessCharacteristic1 = tbl.ProcessCharacteristic1;
ProcessCharacteristic2 = tbl.ProcessCharacteristic2;
Reworkcharacteristic1 = tbl.Reworkcharacteristic1;
Reworkcharacteristic2 = tbl.Reworkcharacteristic2;
Repaircharacteristic1 = tbl.Repaircharacteristic1;
ReworkMinutes = tbl.ReworkMinutes;
Qualityrating = tbl.Qualityrating;
CaptureDate = tbl.CaptureDate;
ReworkDate = tbl.ReworkDate;
QualityCharacteristic7 = tbl.QualityCharacteristic7;

%% Clear temporary variables
clear opts tbl
x = ReworkMinutes;
y = Qualityrating;
z = ProductID;
a = Productcharacteristic1;
b = QualityCharacteristic8;
c = QualityCharacteristic1;
d = QualityCharacteristic2;
e = QualityCharacteristic3;
f = QualityCharacteristic4;
g = QualityCharacteristic5;
h = QualityCharacteristic6;
i = ProcessCharacteristic1;
j = ProcessCharacteristic2;
k = Reworkcharacteristic1;
l = Reworkcharacteristic2;
m = Repaircharacteristic1;
% create a table for the data (x,y, defined above):
data = table(z,a,b,c,d,e,f,g,h,i,j,k,l,m,x,y,'VariableNames',{'ProductID','Productcharacteristic1','QualityCharacteristic8','QualityCharacteristic1','QualityCharacteristic2','QualityCharacteristic3','QualityCharacteristic4','QualityCharacteristic5','QualityCharacteristic6','ProcessCharacteristic1','ProcessCharacteristic2','Reworkcharacteristic1','Reworkcharacteristic2','Repaircharacteristic1','ReworkMinutes','Qualityrating'});

data = sortrows(data)

for i = 1:18913
    if strcmp(data(i,14),'b');
        data(i,:) = []
    end
end
