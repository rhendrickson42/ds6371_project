*FILENAME REFFILE_PREDICT 'c:\temp\kaggle_predict.csv'; 

/* 
   MSDS6371 - Kaggle Submission 

   The Train0 and Test0 data sets have been loaded and cleaned. 

   1. load Train0 and Test0 data sets 
      project6371_kaggle_ames_training.sas -> train0
      project6371_kaggle_ames_test.sas     -> test0
   2. run this model, it generates output .csv file. 
   3. login to kaggle portal, navigate to Ames Housing Competition, 
      submit .csv file, You should get score of 0.30871 , lower is better. 
      (take screenshot of Kaggle result if lower for report)
*/


title "Train0 - verify  Missing Values";
proc means data=train0 nmiss n; run;

title "Test0 - verify Missing Values";
proc means data=test0 nmiss n; run;

data test001;
set test0;
SalePrice = .;
LogSalePrice = .;
;

data train001;
set train0 test001;
run;

title "Train0 - First 5";
proc print data=train0 (obs=5);
run;

title "Test0 - First 5";
proc print data=test0 (obs=5);
run;

title "Train001 - First 5";
proc print data=train001 (obs=5);
run;

/* example model
title "Proc GLM on Train001, plots=all. (output predictions, after observation 1460)";
proc glm data=train001 plots=all;
class RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType;
model SalePrice = RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType LotArea BedroomAbvGr YearBuilt / cli solution;
output out = results p = Predict;
run;
*/ 

title "Proc GLM on Train001 - 5-Fold Cross Validation. (output predictions, after observation 1460)";
proc glmselect data=train001 testdata=test001 plots(stepaxis = number) = (criterionpanel ASEPlot);
class Neighborhood SaleCondition;
model LogSalePrice=Neighborhood SaleCondition OverallQual LogLotArea 
    LogGrLiving LogGarArea LogTotalBsmtSF YearBuilt 
    YearRemodAdd/selection=stepwise(choose=CV stop=CV) CVDETAILS;
output out = results p = Predict;
run;


/* can't have negative predictions because of RMLSE */
/* also must have only two columns with appropriate labels. */

data results0;
set results;
if Predict > 0 then SalePrice = exp(Predict);
if Predict < 0 then SalePrice = 10000;
keep id SalePrice;
where id > 1460;
;

proc means data = results0;
var SalePrice;
run;


PROC EXPORT DATA= results0 
  OUTFILE = 'd:\temp\kaggle_predict.csv' replace
  DBMS=CSV REPLACE;
  PUTNAMES=YES;
RUN;
