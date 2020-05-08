opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Totalduration", "Alarmtext", "Alarmclass"];
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Totalduration", "Alarmtext", "Alarmclass"];
opts.SelectedVariableNames = ["Totalduration", "Alarmtext", "Alarmclass"];
opts.VariableTypes = ["string", "string", "double", "categorical", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Alarmtext", "Alarmclass"], "EmptyFieldRule", "auto");

% Import the data
bmw2 = readtable("C:\Users\User\Documents\MATLAB\mdm3\bmw2.csv", opts);



clear opts
encoded1 = createOneHotEncoding(bmw2,'Alarmtext');
encoded1(:,[1 2])= [];
% 
encoded2 = createOneHotEncoding(bmw2,'Alarmclass');
encoded2(:,[1 2])= [];
% 
BMW2 = [bmw2(:,1) encoded1 encoded2];

b = table2array(bmw2(:,2));
B = []

m = stepwiselm(BMW2, 'ResponseVar',[1],'PredictorVars', [2:30] );

subplot(2,2,1)
 plotResiduals(m)
 % plot to check normality - histogram follows a mound shape distribution
 subplot(2,2,2)
 plotResiduals(m,'probability')
 % and the residual porability plot forms a fairly straight  line so 
 % normality can be assumed for data
 subplot(2,2,3)
 plotResiduals(m,'fitted')
 % residuals versus fitted values (check for homoscedasticity)- residual vs
 % fitted values not funnel or football shapped, theres no evidence to suggest
 % heteroscedasticity therefore error variance is constant.  
 subplot(2,2,4)
 plotResiduals(m,'lagged')


