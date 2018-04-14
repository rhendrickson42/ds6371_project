filename CSV URL "https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/train.csv";


data TRAIN1    ;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile CSV
delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
/* note regex used : \d\d\d[ ]* */
  informat Id 4. ;
  informat MSSubClass $3. ;
  informat MSZoning $7. ;  /* #31 c (all) */
  informat LotFrontage best32. ;
  informat LotArea best32. ;
  informat Street $4. ;
  informat Alley $4. ;
  informat LotShape $3. ;
  informat LandContour $3. ;
  informat Utilities $6. ;
  informat LotConfig $7. ;
  informat LandSlope $3. ;
  informat Neighborhood $7. ;
  informat Condition1 $6. ;
  informat Condition2 $6. ;
  informat BldgType $6. ;
  informat HouseStyle $6. ;
  informat OverallQual best32. ;
  informat OverallCond best32. ;
  informat YearBuilt best32. ;
  informat YearRemodAdd best32. ;
  informat RoofStyle $7. ;
  informat RoofMatl $7. ;
  informat Exterior1st $7. ;
  informat Exterior2nd $7. ;
  informat MasVnrType $7. ;
  informat MasVnrArea best32. ;
  informat ExterQual $2. ;
  informat ExterCond $2. ;
  informat Foundation $6. ;
  informat BsmtQual $2. ;
  informat BsmtCond $2. ;
  informat BsmtExposure $2. ;
  informat BsmtFinType1 $3. ;
  informat BsmtFinSF1 best32. ;
  informat BsmtFinType2 $3. ;
  informat BsmtFinSF2 best32. ;
  informat BsmtUnfSF best32. ;
  informat TotalBsmtSF best32. ;
  informat Heating $5. ;
  informat HeatingQC $2. ;
  informat CentralAir $1. ;
  informat Electrical $5. ;
  informat _1stFlrSF best32. ;
  informat _2ndFlrSF best32. ;
  informat LowQualFinSF best32. ;
  informat GrLivArea best32. ;
  informat BsmtFullBath best32. ;
  informat BsmtHalfBath best32. ;
  informat FullBath best32. ;
  informat HalfBath best32. ;
  informat BedroomAbvGr best32. ;
  informat KitchenAbvGr best32. ;
  informat KitchenQual $2. ;
  informat TotRmsAbvGrd best32. ;
  informat Functional $4. ;
  informat Fireplaces best32. ;
  informat FireplaceQu $2. ;
  informat GarageType $7. ;
  informat GarageYrBlt $4. ;
  informat GarageFinish $3. ;
  informat GarageCars best32. ;
  informat GarageArea best32. ;
  informat GarageQual $2. ;
  informat GarageCond $2. ;
  informat PavedDrive $1. ;
  informat WoodDeckSF best32. ;
  informat OpenPorchSF best32. ;
  informat EnclosedPorch best32. ;
  informat _3SsnPorch best32. ;
  informat ScreenPorch best32. ;
  informat PoolArea best32. ;
  informat PoolQC $2. ;
  informat Fence $5. ;
  informat MiscFeature $4. ;
  informat MiscVal best32. ;
  informat MoSold best32. ;
  informat YrSold best32. ;
  informat SaleType $5. ;
  informat SaleCondition $7. ;
  informat SalePrice best32. ;
  format Id 4. ;
  format MSSubClass $3. ;
  format MSZoning $2. ;
  format LotFrontage best12. ;
  format LotArea best12. ;
  format Street $4. ;
  format Alley $4. ;
  format LotShape $3. ;
  format LandContour $3. ;
  format Utilities $6. ;
  format LotConfig $7. ;
  format LandSlope $3. ;
  format Neighborhood $7. ;
  format Condition1 $6. ;
  format Condition2 $6. ;
  format BldgType $6. ;
  format HouseStyle $6. ;
  format OverallQual best12. ;
  format OverallCond best12. ;
  format YearBuilt best12. ;
  format YearRemodAdd best12. ;
  format RoofStyle $7. ;
  format RoofMatl $7. ;
  format Exterior1st $7. ;
  format Exterior2nd $7. ;
  format MasVnrType $7. ;
  format MasVnrArea $4. ;
  format ExterQual $2. ;
  format ExterCond $2. ;
  format Foundation $6. ;
  format BsmtQual $2. ;
  format BsmtCond $2. ;
  format BsmtExposure $2. ;
  format BsmtFinType1 $3. ;
  format BsmtFinSF1 best12. ;
  format BsmtFinType2 $3. ;
  format BsmtFinSF2 best12. ;
  format BsmtUnfSF best12. ;
  format TotalBsmtSF best12. ;
  format Heating $5. ;
  format HeatingQC $2. ;
  format CentralAir $1. ;
  format Electrical $5. ;
  format _1stFlrSF best12. ;
  format _2ndFlrSF best12. ;
  format LowQualFinSF best12. ;
  format GrLivArea best12. ;
  format BsmtFullBath best12. ;
  format BsmtHalfBath best12. ;
  format FullBath best12. ;
  format HalfBath best12. ;
  format BedroomAbvGr best12. ;
  format KitchenAbvGr best12. ;
  format KitchenQual $2. ;
  format TotRmsAbvGrd best12. ;
  format Functional $4. ;
  format Fireplaces best12. ;
  format FireplaceQu $2. ;
  format GarageType $7. ;
  format GarageYrBlt $4. ;
  format GarageFinish $3. ;
  format GarageCars best12. ;
  format GarageArea best12. ;
  format GarageQual $2. ;
  format GarageCond $2. ;
  format PavedDrive $1. ;
  format WoodDeckSF best12. ;
  format OpenPorchSF best12. ;
  format EnclosedPorch best12. ;
  format _3SsnPorch best12. ;
  format ScreenPorch best12. ;
  format PoolArea best12. ;
  format PoolQC $2. ;
  format Fence $5. ;
  format MiscFeature $4. ;
  format MiscVal best12. ;
  format MoSold best12. ;
  format YrSold best12. ;
  format SaleType $5. ;
  format SaleCondition $7. ;
  format SalePrice best12. ;
input
  Id
  MSSubClass
  MSZoning $
  LotFrontage $
  LotArea
  Street $
  Alley $
  LotShape $
  LandContour $
  Utilities $
  LotConfig $
  LandSlope $
  Neighborhood $
  Condition1 $
  Condition2 $
  BldgType $
  HouseStyle $
  OverallQual
  OverallCond
  YearBuilt
  YearRemodAdd
  RoofStyle $
  RoofMatl $
  Exterior1st $
  Exterior2nd $
  MasVnrType $
  MasVnrArea $
  ExterQual $
  ExterCond $
  Foundation $
  BsmtQual $
  BsmtCond $
  BsmtExposure $
  BsmtFinType1 $
  BsmtFinSF1
  BsmtFinType2 $
  BsmtFinSF2
  BsmtUnfSF
  TotalBsmtSF
  Heating $
  HeatingQC $
  CentralAir $
  Electrical $
  _1stFlrSF
  _2ndFlrSF
  LowQualFinSF
  GrLivArea
  BsmtFullBath
  BsmtHalfBath
  FullBath
  HalfBath
  BedroomAbvGr
  KitchenAbvGr
  KitchenQual $
  TotRmsAbvGrd
  Functional $
  Fireplaces
  FireplaceQu $
  GarageType $
  GarageYrBlt $
  GarageFinish $
  GarageCars
  GarageArea
  GarageQual $
  GarageCond $
  PavedDrive $
  WoodDeckSF
  OpenPorchSF
  EnclosedPorch
  _3SsnPorch
  ScreenPorch
  PoolArea
  PoolQC $
  Fence $
  MiscFeature $
  MiscVal
  MoSold
  YrSold
  SaleType $
  SaleCondition $
  SalePrice
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;


/* **************************************** */
/* DATA CLEANUP */
/* **************************************** */

title "Train1 - Data Set Missing Values";
proc means data=train1 nmiss n; run;

/* fix missing values */
data train1;
  set train1;
  if missing(LotFrontage) then LotFrontage = 0;
run;

title "Train1 - Data Set Fixed Missing Values";
proc means data=train1 nmiss n; run;

title "Train1 - First 10";
proc print data=train1 (obs=10);
run; quit;

proc sgscatter data=train1;
plot SalePrice*GrLivArea /group=Neighborhood ;
run;




data trainRed;
  set train1;
    if Neighborhood = 'NAmes' then Nei = Neighborhood;
    if Neighborhood = 'Edwards' then Nei = "Ed-Brk";
    if Neighborhood = 'BrkSide' then Nei = "Ed-Brk"; else Nei = "Others";
     LogLotArea = Log(LotArea);
     LogMasVnrArea = Log(MasVnrArea+1);
     LogBsmtFinSF1 = Log(BsmtFinSF1+1);
     Log1stFlrSF = Log(_1stFlrSF);
     LogPoolArea = Log(PoolArea+1);
     LogMiscVal = Log(MiscVal+1);
     LogGarageArea = Log(GarageArea);
     LogWoodDeckSF = Log(WoodDeckSF+1);
     LogOpenPorchSF = Log(OpenPorchSF+1);
     LogEnclosedPorch = Log(EnclosedPorch+1);
     Log3SsnPorch = Log(_3SsnPorch+1);
     LogScreenPorch = Log(ScreenPorch+1);
     
    if GrLivArea < 4500;
    If GrLivArea > 0;
    if SalePrice > 0;
    logSales = log(SalePrice);
    logLiv = log(GrLivArea);
    if Nei = "NAmes" then d2 = 1; else d2 = 0;
    if Nei = "Others" then d3 = 1; else d3 = 0;
    
    int1 = d1 * GrLivArea; int2 = d2 * GrLivArea; int3 = d3 * GrLivArea;
    l_int1 = d1 * logLiv; l_int2 = d2 * logLiv; l_int3 = d3 * logLiv;
    centLint1 = (logLiv - 7.2660236) * (d1 - 0.0672154);
    
    centLint2 = (logLiv - 7.2660236) * (d2 - 0.1543210);
    centLint3 = (logLiv - 7.2660236) * (d3 - 0.7386831);
run;


proc sort data=trainRed;
by descending GrLivArea;
run;
 
proc means data=trainRed;
var GrLivArea logLiv d2 d3;
run;

/**********************************************************************************************************************/
proc sgscatter data=trainRed;
where Nei = "Edwards";
plot SalePrice*GrLivArea / reg ;
run;
 
proc sgscatter data=trainRed;
plot logSales*GrLivArea / group=Nei reg ;
run;
 
/* Have Curvature */
proc sgscatter data=trainRed;
plot SalePrice*logLiv / group=Nei reg ;
run;
 
proc sgscatter data=trainRed;
plot logSales*logLiv / group=Nei reg ;
run;
/**************************************************************************************************************************/
 
/* Residual Plot showing possible unequal spread) */
proc glm data=trainRed plots=all;
class Nei(ref = "Ed-Brk");
model SalePrice = GrLivArea | Nei / solution ;
run;
 
/*************---------------------------------------------------------*/
/* Looks Ok as compared to Previous */
proc glm data=trainRed plots=all;
class Nei(ref = "Ed-Brk");
model logSales = GrLivArea | Nei / solution;
run;
 
proc reg data=trainRed plots=all;
model logSales = GrLivArea d1 d2 d3 int1 int2 int3/VIF;
run;
/*************---------------------------------------------------------*/
 
proc glm data=trainRed plots=all;
class Nei(ref = "Ed-Brk");
model logSales = logLiv | Nei / solution;
run;
 
proc reg data=trainRed plots=all;
model logSales = logLiv d2 d3 centLint2 centLint3/VIF;
run;
/**********************************************************************************/
 
                                                                      Q2 : Code
/*********************************************************************************/
 
/* Create a Heatmap implementation of a correlation matrix */
ods path work.mystore(update) sashelp.tmplmst(read);
 
proc template;
                define statgraph corrHeatmap;
   dynamic _Title;
                                begingraph;
         entrytitle _Title;
                                                rangeattrmap name='map';
                                                /* select a series of colors that represent a "diverging"  */
                                                /* range of values: stronger on the ends, weaker in middle */
                                                /* Get ideas from http://colorbrewer.org                   */
                                                range -1 - 1 / rangecolormodel=(cxD8B365 cxF5F5F5 cx5AB4AC);
                                                endrangeattrmap;
                                                rangeattrvar var=r attrvar=r attrmap='map';
                                                layout overlay /
                                                                xaxisopts=(display=(line ticks tickvalues))
                                                                yaxisopts=(display=(line ticks tickvalues));
                                                                heatmapparm x = x y = y colorresponse = r / xbinaxis=false ybinaxis=false
                                                                                colormodel=THREECOLORRAMP name = "heatmap" display=all;
                                                                continuouslegend "heatmap" /
                                                                                orient = vertical location = outside title="Pearson Correlation";
                                                endlayout;
                                endgraph;
                end;
run;
 
/* Prepare the correlations coeff matrix: Pearson's r method */
%macro prepCorrData(in=,out=);
                /* Run corr matrix for input data, all numeric vars */
                proc corr data=&in. noprint
                                pearson
                                outp=work._tmpCorr
                                vardef=df
                ;
                with SalePrice;
                run;
 
                /* prep data for heatmap */
data &out.;
                keep x y r;
                set work._tmpCorr(where=(_TYPE_="CORR"));
                array v{*} _numeric_;
                x = _NAME_;
                do i = dim(v) to 1 by -1;
                                y = vname(v(i));
                                r = v(i);
                                /* creates a diagonally sparse matrix */
                                if (i<_n_) then
                                                r=.;
                                output;
                end;
run;
 
proc datasets lib=work nolist nowarn;
                delete _tmpcorr;
quit;
%mend;
 
/* Build the graphs */
ods graphics /height=600 width=800 imagemap;
 
%prepCorrData(in=KaggData,out=out_r);
proc sgrender data=out_r template=corrHeatmap;
   dynamic _title="Corr matrix for SalePrice";
run;
 
proc corr data=KaggData;
with SalePrice;
run;
 
data out_r;
set out_r;
modr = abs(r);
run;
 
proc sort data=out_r;
by descending modr;
run;
 
proc print data=out_r;
run;
 
options validvarname=any;
proc corr data=KaggData plots=matrix;
var OverallQual GrLivArea GarageCars GarageArea TotalBsmtSF "1stFlrSF"n FullBath TotRmsAbvGrd YearBuilt YearRemodAdd GarageYrBlt MasVnrArea Fireplaces;
run;
 
proc sgscatter data=KaggData;
matrix SalePrice OverallQual GrLivArea GarageCars;
run;
 
proc sgscatter data=KaggData;
matrix SalePrice GarageArea TotalBsmtSF "1stFlrSF"n;
run;
 
proc sgscatter data=KaggData;
matrix SalePrice FullBath TotRmsAbvGrd YearBuilt;
run;
 
proc sgscatter data=KaggData;
matrix SalePrice YearRemodAdd GarageYrBlt MasVnrArea Fireplaces;
run;
 
/* Test Log Corr */