
opts = delimitedTextImportOptions("NumVariables", 19);

% Specify range and delimiter
opts.DataLines = [2, 18913];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["ProductID", "Productcharacteristic1", "QualityCharacteristic8", "QualityCharacteristic1", "QualityCharacteristic2", "QualityCharacteristic3", "QualityCharacteristic4", "QualityCharacteristic5", "QualityCharacteristic6", "ProcessCharacteristic1", "ProcessCharacteristic2", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "ReworkMinutes", "Qualityrating", "CaptureDate", "ReworkDate", "QualityCharacteristic7"];
opts.VariableTypes = ["double", "double", "char", "double", "double", "double", "double", "char", "char", "char", "double", "char", "char", "char", "double", "double", "char", "char", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Repaircharacteristic1", "CaptureDate", "ReworkDate"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["ProcessCharacteristic1","QualityCharacteristic8", "QualityCharacteristic5", "QualityCharacteristic6", "Reworkcharacteristic1", "Reworkcharacteristic2", "Repaircharacteristic1", "CaptureDate", "ReworkDate"], "EmptyFieldRule", "auto");

% Import the data
bmw1 = readtable("C:\Users\User\Documents\MATLAB\mdm3\bmw1.csv", opts);


clear opts

% Gets rid of 'b's and NaN's
indices = strcmp(bmw1.Repaircharacteristic1,'b');
bmw1(indices,:) = [];

indices1 = isnan(bmw1.ProductID);
bmw1(indices1,:) = [];

data = sortrows(bmw1);
data1 = data;
r1 = find(data.Qualityrating(:) == 1);
data1 = data1(r1,:);

data2 = data;
r2 = find(data.Qualityrating(:) == 2);
data2 = data2(r2,:);

data0 = data;
r0 = find(data.Qualityrating(:) == 0);
data0(r0,:) = [];

%X = str2num(data.QualityCharacteristic8)
% 
 %[R,PValue] = corrplot(data,'type','Spearman');

[rho,pval] = corrcoef(data.ReworkMinutes, data.Qualityrating);


















%  for i = 2:14
%      a = zeros(12386,i);
%      a(:,i) = table(data(:,i));
%      %newData = createOneHotEncoding(data, 'data(:,i)');
%      
%  end










% for i = 4:width(finalData)
%     
%     p(i) = finalData(:,):
% end
    
    
    
%


 newData1 = createOneHotEncoding(data,'QualityCharacteristic1');
 newData1(:,1:18) = [];
 
 newData2 = createOneHotEncoding(data,'QualityCharacteristic2');
 newData2(:,1:18) = [];
 
 newData3 = createOneHotEncoding(data,'QualityCharacteristic3');
 newData3(:,1:18) = [];
 
 newData4 = createOneHotEncoding(data,'QualityCharacteristic4');
 newData4(:,1:18) = [];
 
 newData5 = createOneHotEncoding(data,'QualityCharacteristic5');
 newData5(:,1:18) = [];
 
 newData6 = createOneHotEncoding(data,'QualityCharacteristic6');
 newData6(:,1:18) = [];
 
 newData7 = createOneHotEncoding(data,'QualityCharacteristic7');
 newData7(:,1:18) = [];
 
 newData8 = createOneHotEncoding(data,'QualityCharacteristic8');
 newData8(:,1:18) = [];
 
 newData9 = createOneHotEncoding(data,'ProcessCharacteristic1');
 newData9(:,1:18) = [];
 
 newData10 = createOneHotEncoding(data,'ProcessCharacteristic2');
 newData10(:,1:18) = [];
 
 newData11 = createOneHotEncoding(data,'Reworkcharacteristic1');
 newData11(:,1:18) = [];
 
 newData12 = createOneHotEncoding(data,'Reworkcharacteristic2');
 newData12(:,1:18) = [];
 
 newData13 = createOneHotEncoding(data,'Repaircharacteristic1');
 newData13(:,1:18) = [];
 
 newData14 = createOneHotEncoding(data,'Productcharacteristic1');
 newData14(:,1:18) = [];
 
 newData15 = createOneHotEncoding(data,'Qualityrating');
 newData15(:,1:18) = [];
 
 newData = [newData1 newData2 newData3 newData4 newData5 newData6 newData7 newData8 newData9 newData10 newData11 newData12 newData13 newData14];
 
 newDataa = [newData15 newData1 newData2 newData3 newData4 newData5 newData6 newData7 newData8 newData9 newData10 newData11 newData12 newData13 newData14];
 
 finalData = addvars(newData,data.ProductID, data.ReworkMinutes, data.Qualityrating, 'Before', 1,'NewVariableNames',{'ProductID','ReworkMinutes','QualityRating'});
 
 m1 = fitlm(finalData, 'ResponseVar',[3],'PredictorVars', [4:705] )
 m2 = fitlm(finalData, 'ResponseVar',[2],'PredictorVars', [3] )
 figure(4)
 plot(m1)
  P = m1.Coefficients.pValue;
  P(1) = [];
  colToDelete = [];
  maxPV = 0.05;
  t = finalData;
  for i = 4:width(finalData)
      if P(i-3) > maxPV
          colToDelete = [colToDelete , i];
      end
  end
 t(:,colToDelete) = [];
 t(:,[1 :3]) = [];
 
 c = [t.Properties.VariableNames]'
 
% %m1 = fitglm(newDataa, 'ResponseVar',[1 2],'PredictorVars', [3:703] )
 
% % for i = [3: width(finalData)]
% %     m1 = fitlm(finalData, 'Qualityrating ~ i ')
% % array = table2array(finalData);
% % a = size(array)
% % 
% % for i = [3:a(2)]
% %     m1 = fitlm(array(:,1),array(:,i));
% %     
% % end
% 
% predictorVariables = [];
% for i=[16]
%     [myVariable(i).list,~,myVariable(i).lookup]=unique(data0(:,i));
%     numRows = length(myVariable(i).lookup);
%     
%     
%     numCols = height(myVariable(i).list);
%     tmp = zeros(numRows,numCols);
%     tmp(sub2ind([numRows,numCols],[1:numRows]',myVariable(i).lookup))=1;
%     predictorVariables = [predictorVariables, tmp];
% end
% %% 
% for i=[3]
%     [myVariable(i).list,~,myVariable(i).lookup]=unique(data0(:,i));
%     numRows = length(myVariable(i).lookup);
%     
%     
%     numCols = height(myVariable(i).list);
%     tmp1 = zeros(numRows,numCols);
%     tmp1(sub2ind([numRows,numCols],[1:numRows]',myVariable(i).lookup))=1;
%     predictorVariables = [predictorVariables, tmp1];
% end
% 
% 
% % array = table2array(data0(:,[15 16]));
% % 
% % time = unique(array(:,1));
% % fraction = zeros(0,length(time));
% % for i = 1:length(time)
% %  idx = find(array(:,2)==time(i));
% %  fraction(i) = sum(array(idx,1))/length(idx);
% % end
% % 
% % plot(time,fraction,'.')
% % xlabel('temperature (degrees Celsius)')
% % ylabel('proportion of successful prints')
% 
% %m1 = fitlm(data0.ReworkMinutes,tmp,'Distribution','Binomial')
% 
% 
% 
% 
% % P = m1.Coefficients.pValue;
% % P(1) = [];
% % colToDelete = [];
% % maxPV = 0.99999;
% % t = tmp;
% % for i = 1:346
% %     if P(i) >= maxPV
% %         colToDelete = [colToDelete , i];
% %     end
% % end
% % t(:,colToDelete) = [];
% % m2 = fitlm(t,data.Qualityrating)
% % figure(1)
% % plot(m1)
% % P2 = m2.Coefficients.pValue;
% % P2(1) = [];
% % colToDelete2 = [];
% % maxPV2 = 0.2;
% % t2 = t;
% % for i = 1:116
% %     if P2(i) > maxPV2
% %         colToDelete2 = [colToDelete2 , i];
% %     end
% % end
% % t2(:,colToDelete2) = [9];
% % 
% % m3 = fitlm(t2,data.Qualityrating)
% 
  figure(2)
  subplot(2,2,1)
  plotResiduals(m1)
  % plot to check normality - histogram follows a mound shape distribution
  subplot(2,2,2)
  plotResiduals(m1,'probability')
  % and the residual porability plot forms a fairly straight  line so 
  % normality can be assumed for data
  subplot(2,2,3)
  plotResiduals(m1,'fitted')
  % residuals versus fitted values (check for homoscedasticity)- residual vs
  % fitted values not funnel or football shapped, theres no evidence to suggest
  % heteroscedasticity therefore error variance is constant.  
  subplot(2,2,4)
  plotResiduals(m1,'lagged')
 
  
  figure(3)
  subplot(2,2,1)
  plotResiduals(m2)
  % plot to check normality - histogram follows a mound shape distribution
  subplot(2,2,2)
  plotResiduals(m2,'probability')
  % and the residual porability plot forms a fairly straight  line so 
  % normality can be assumed for data
  subplot(2,2,3)
  plotResiduals(m2,'fitted')
  % residuals versus fitted values (check for homoscedasticity)- residual vs
  % fitted values not funnel or football shapped, theres no evidence to suggest
  % heteroscedasticity therefore error variance is constant.  
  subplot(2,2,4)
  plotResiduals(m2,'lagged') 

  
  % % for i = 0:length(data.Repaircharacteristic1)
% %     array = []
% %     array(i) = sum(count( data.Repaircharacteristic1 , 'm' ))./length(data.Repaircharacteristic1) ;
% % end
% 
% 
% 
% 
% 
% 
% 
% 
% % figure(1)
% % subplot(2,2,1)
% % plotResiduals(m)
% % % plot to check normality - histogram follows a mound shape distribution
% % subplot(2,2,2)
% % plotResiduals(m,'probability')
% % % and the residual porability plot forms a fairly straight  line so 
% % % normality can be assumed for data
% % subplot(2,2,3)
% % plotResiduals(m,'fitted')
% % % residuals versus fitted values (check for homoscedasticity)- residual vs
% % % fitted values not funnel or football shapped, theres no evidence to suggest
% % % heteroscedasticity therefore error variance is constant.  
% % subplot(2,2,4)
% % plotResiduals(m,'lagged')
% 
% 
