*FILENAME REFFILE_PREDICT 'c:\temp\kaggle_predict.csv'; 

/* 
   Example - Kaggle Submission 

   The Train1 and Test1 data sets have been loaded and cleaned. 
   1. load Train1 and Test1 data sets (run other .SAS scripts). 
   2. run this sample model, it generates output .csv file. 
   3. login to kaggle portal, navigate to Ames Housing Competition, 
      submit .csv file, You should get score of 0.30871 , lower is better. 
*/


title "Train1 - verify  Missing Values";
proc means data=train1 nmiss n; run;

title "Test1 - verify Missing Values";
proc means data=test1 nmiss n; run;

data test2;
set test1;
SalePrice = .;
;

data train2;
set train1 test2;
run;

title "Train1 - First 10";
proc print data=train1 (obs=10);
run;

title "Test1 - First 10";
proc print data=test1 (obs=10);
run;

title "Train2 - First 10";
proc print data=train2 (obs=10);
run;

title "Proc GLM on Train2, plots=all. (output predictions, after observation 1460)";
proc glm data=train2 plots=all;
class RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType;
model SalePrice = RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType LotArea BedroomAbvGr YearBuilt / cli solution;
output out = results p = Predict;
run;

/* can't have negative predictions because of RMLSE */
/* also must have only two columns with appropriate labels. */

data results2;
set results;
if Predict > 0 then SalePrice = Predict;
if Predict < 0 then SalePrice = 10000;
keep id SalePrice;
where id > 1460;
;

proc means data = results2;
var SalePrice;
run;


PROC EXPORT DATA= WORK.RESULTS2 
  OUTFILE = 'd:\temp\kaggle_predict.csv' replace
  DBMS=CSV REPLACE;
  PUTNAMES=YES;
RUN;
