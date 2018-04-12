filename CSV URL "https://dl.dropboxusercontent.com/spa/afq05cp80hp4ezn/downloads/public/msds-data/test.csv";

data TEST1;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile CSV
delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
/* note regex used : \d\d\d[ ]* */
informat Id 4. ;
informat MSSubClass $3. ;
informat MSZoning $7. ;
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
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;



/* **************************************** */
/* DATA CLEANUP */
/* **************************************** */

title "Test1 - Data Set Missing Values";
proc means data=test1 nmiss n; run;

/* fix missing values */
data test1;
  set test1;
  if missing(LotFrontage) then LotFrontage = 0;
  if missing(MasVnrArea) then MasVnrArea = 0;
  if missing(BsmtFinSF1) then BsmtFinSF1 = 0;
  if missing(BsmtFinSF2) then BsmtFinSF2 = 0;
  if missing(BsmtUnfSF) then BsmtUnfSF = 0;
  if missing(TotalBsmtSF) then TotalBsmtSF = 0;
  if missing(BsmtFullBath) then BsmtFullBath = 0;
  if missing(BsmtHalfBath) then BsmtHalfBath = 0;
  if missing(GarageCars) then GarageCars = 0;
  if missing(GarageArea) then GarageArea = 0;
run;

title "Test1 - Data Set Fixed Missing Values";
proc means data=test1 nmiss n; run;

title "Test1 - First 10";
proc print data=test1 (obs=10);
run;



