filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/clean/qoi1.csv?token=AC0MhyXwsRezAsjo2cXdgjbC9E-tjp3wks5a0ANawA%3D%3D";
proc import datafile=CSV out=dataset
    (where = (Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide'))
    dbms=CSV replace;
    getnames=yes;
    datarow=2;
run;
proc print data = dataset2 (obs=10); run;
data dataset2;
    set dataset;
    if Neighborhood = 'Edwards' then d1=1; else d1=0;
    if Neighborhood = 'NAmes'   then d2=1; else d2=0;
    
    LogSalePrice = Log(SalePrice);
    LogGrLivArea = Log(GrLivArea);
    
    int1 = d1*GrLivArea;
    int2 = d2*GrLivArea;
    
    int1Log = d1*LogGrLivArea;
    int2Log = d2*LogGrLivArea;
    
    cent1 = (GrLivArea - 1301.83)*(d1 - 0.2610966);
    cent2 = (GrLivArea - 1301.83)*(d2 - 0.5874674);
    
    cent1Log = (LogGrLivArea - 7.1193132)*(d1 - 0.2610966);
    cent2Log = (LogGrLivArea - 7.1193132)*(d2 - 0.2610966);
run;
proc print data = dataset2 (obs=10); run;

/************    MEANS  *******************************************/
proc means data=dataset2;
var GrLivArea d1 d2;
run;

/************    PLOTS *******************************************/
/*  NON Transformed */
proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Non Transformed: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
        TITLE "Non Transformed: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Non Transformed: BrkSide (Reference)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    TITLE "Non Transformed: All Data"; 
run; quit;

/* 
   Regular Model 
*/
title 'Non Transformed: Interaction Terms';
proc reg data = dataset2;
model SalePrice = GrLivArea d1 d2 int1 int2 / clb VIF;
run; quit;
title 'Non Transformed: Centered Terms';
proc reg data = dataset2;
model SalePrice = GrLivArea d1 d2 cent1 cent2 / clb VIF;
run; quit;




/*  Linear-Log Transformed */
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Linear-Log: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
    TITLE "Linear-Log: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Linear-Log: BrkSide (Reference)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=SalePrice / Group=Neighborhood;
    TITLE "Linear-Log: All Data"; 
run; quit;
/* 
   Linear-Log Model 
*/
title 'Linear-Log: Interaction Terms';
proc reg data = dataset2;
model SalePrice = LogGrLivArea d1 d2 int1Log int2Log / clb VIF;
run; quit;
title 'Linear-Log: Centered Terms';
proc reg data = dataset2;
model SalePrice = LogGrLivArea d1 d2 cent1Log cent2Log / clb VIF;
run; quit;




/*  Log-Log Transformed */
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Log-Log: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
    TITLE "Log-Log: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Log-Log: BrkSide (Reference)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    TITLE "Log-Log: All Data"; 
run; quit;
/*
    Log-Log Model
*/
title 'Log-Log: Interaction Terms';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d1 d2 int1Log int2Log / clb VIF;
run; quit;
title 'Log-Log: Centered Terms';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d1 d2 cent1Log cent2Log / clb VIF;
run; quit;
title 'Log-Log: Centered Terms, d1 removed';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d2 cent1Log cent2Log / clb VIF;
run; quit;
title 'Log-Log: Centered Terms, d1 and cent1Log removed';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d2 cent2Log / clb VIF;
run; quit;




/*  Log-Linear Transformed */
proc sgplot data=dataset2;
    scatter x=GrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Log-Linear: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
    TITLE "Log-Linear: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Log-Linear: BrkSide (Reference)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=GrLivArea y=LogSalePrice / Group=Neighborhood;
    TITLE "Log-Linear: All Data"; 
run; quit;
/*
    Log-Linear Model
*/
title 'Log-Linear: Interaction Terms';
proc reg data = dataset2;
model LogSalePrice = GrLivArea d1 d2 int1 int2 / clb VIF;
run; quit;
title 'Log-Linear: Centered Terms';
proc reg data = dataset2;
model LogSalePrice = GrLivArea d1 d2 cent1 cent2 / clb VIF;
run; quit;


/*****************************************************************
Retest with Observations removed

(where = ((Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide') AND (Id NE 524 AND Id NE 1299 AND Id NE 725 AND Id NE 643)))

*****************************************************************/
filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/clean/qoi1.csv?token=AC0MhyXwsRezAsjo2cXdgjbC9E-tjp3wks5a0ANawA%3D%3D";
proc import datafile=CSV out=dataset
    (where = ((Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide') AND (Id NE 524 AND Id NE 1299)))
    dbms=CSV replace;
    getnames=yes;
    datarow=2;
run;
proc print data = dataset2 (obs=10); run;
data dataset2;
    set dataset;
    if Neighborhood = 'Edwards' then d1=1; else d1=0;
    if Neighborhood = 'NAmes'   then d2=1; else d2=0;
    
    LogSalePrice = Log(SalePrice);
    LogGrLivArea = Log(GrLivArea);
    
    int1 = d1*GrLivArea;
    int2 = d2*GrLivArea;
    
    int1Log = d1*LogGrLivArea;
    int2Log = d2*LogGrLivArea;
    
    cent1 = (GrLivArea - 1301.83)*(d1 - 0.2610966);
    cent2 = (GrLivArea - 1301.83)*(d2 - 0.5874674);
    
    cent1Log = (LogGrLivArea - 7.1193132)*(d1 - 0.2610966);
    cent2Log = (LogGrLivArea - 7.1193132)*(d2 - 0.2610966);
run;
proc print data = dataset2 (obs=10); run;

/*  Log-Log Transformed */
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Log-Log: NAmes (Removed: 524,1299)"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="Edwards (Removed: 524,1299)";
    TITLE "Log-Log: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Log-Log: BrkSide (Reference) (Removed: 524,1299)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    TITLE "Log-Log: All Data (Removed: 524,1299)"; 
run; quit;
/*
    Log-Log Model
*/
title 'Log-Log: Interaction Terms (Removed: 524,1299)';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d1 d2 int1Log int2Log / clb VIF influence;
run; quit;
title 'Log-Log: Centered Terms (Removed: 524,1299)';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d1 d2 cent1Log cent2Log / clb VIF influence;
run; quit;


/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
/**** Models to compare removed Observations to *******************************/


filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/clean/qoi1.csv?token=AC0MhyXwsRezAsjo2cXdgjbC9E-tjp3wks5a0ANawA%3D%3D";
proc import datafile=CSV out=dataset
    (where = ((Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide') AND (Id NE 524 AND Id NE 1299)))
    dbms=CSV replace;
    getnames=yes;
    datarow=2;
run;
data dataset2;
    set dataset;
    if Neighborhood = 'Edwards' then d1=1; else d1=0;
    if Neighborhood = 'NAmes'   then d2=1; else d2=0;
    
    LogSalePrice = Log(SalePrice);
    LogGrLivArea = Log(GrLivArea);
    
    int1 = d1*GrLivArea;
    int2 = d2*GrLivArea;
    
    int1Log = d1*LogGrLivArea;
    int2Log = d2*LogGrLivArea;
    
    cent1 = (GrLivArea - 1301.83)*(d1 - 0.2610966);
    cent2 = (GrLivArea - 1301.83)*(d2 - 0.5874674);
    
    cent1Log = (LogGrLivArea - 7.1193132)*(d1 - 0.2610966);
    cent2Log = (LogGrLivArea - 7.1193132)*(d2 - 0.2610966);
run;

/************PLOTS *******************************************/
/*  Log-Log Transformed */
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Log-Log: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
    TITLE "Log-Log: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Log-Log: BrkSide (Reference)"; 
run; quit;
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    TITLE "Log-Log: All Data"; 
run; quit;

/************ MODELS *******************************************/
/*
    Log-Log Model
*/
title 'Log-Log: Interaction Terms';
proc reg data = dataset2;
model LogSalePrice = LogGrLivArea d1 d2 int1Log int2Log / clb VIF;
run; quit;
title 'Log-Log: Centered Terms';
proc reg data = dataset2;
    model LogSalePrice = LogGrLivArea d1 d2 cent1Log cent2Log / clb VIF  influence;
    output out=b p=yhat r=yresid cookd=cooksd h=lev student=studres;
run; quit;
proc print data = b; run;

/***** REPRINT FOR COMPARISON ****************/
/*  So we can compare with influence numbers */
proc print data = dataset2; run;

/**************************************************************************************************/





filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/kaggle/train.csv?token=AC0Mh1JjkWOapZfRF3ibtc7MJgsBWPjAks5az-w2wA%3D%3D";
proc import datafile=CSV out=dataset
    dbms=CSV replace;
    getnames=yes;
    datarow=2;
run;
/**
   (where = ((Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide') AND (Id NE 524 AND Id NE 1299)))
**/
data dataset2;
    set dataset;
    if Neighborhood = 'Edwards'  then d1=1; else d1=0;
    if Neighborhood = 'NAmes'    then d2=1; else d2=0;
    if Neighborhood = 'BrkSide'  then d3=1; else d3=0;
    
    LogSalePrice = Log(SalePrice);
    LogGrLivArea = Log(GrLivArea);
    
    int1 = d1*GrLivArea;
    int2 = d2*GrLivArea;
    int3 = d3*GrLivArea;
    
    int1Log = d1*LogGrLivArea;
    int2Log = d2*LogGrLivArea;
    int3Log = d3*LogGrLivArea;
    
    cent1 = (GrLivArea - 1506.50)*(d1 - 0.0673077);
    cent2 = (GrLivArea - 1506.50)*(d2 - 0.1545330);
    cent3 = (GrLivArea - 1506.50)*(d3 - 0.0398352);
    
    cent1Log = (LogGrLivArea - 7.2644820)*(d1 - 0.0673077);
    cent2Log = (LogGrLivArea - 7.2644820)*(d2 - 0.1545330);
    cent3Log = (LogGrLivArea - 7.2644820)*(d3 - 0.0398352);
run;

/************    MEANS  *******************************************/
proc means data=dataset2;
var GrLivArea LogGrLivArea d1 d2 d3;
where GrLivArea < 4000;
run;

/************PLOTS *******************************************/
/*****  NON Transformed *****/
/****************************/
proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Non Transformed: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
        TITLE "Non Transformed: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Non Transformed: BrkSide"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where NOT(Neighborhood="NAmes" OR Neighborhood="Edwards" OR Neighborhood="BrkSide");
    TITLE "Non Transformed: OTHER Neighborhoods (Reference)"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    TITLE "Non Transformed: All Neighborhoods"; 
run; quit;

/********   Regular Model  ************/
title 'Non Transformed: Interaction Terms';
proc reg data = dataset2;
model SalePrice = GrLivArea d1 d2 d3 int1 int2 int3 / VIF;
output out=b p=yhat r=yresid cookd=cooksd h=lev;
run; quit;

title 'Non Transformed: Centered Terms';
proc reg data = dataset2;
model SalePrice = GrLivArea d1 d2 d3 cent1 cent2 cent3 / VIF;
run; quit;



/*****  Log-Log Transformed *****/
/****************************/
proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
    TITLE "Log-Log: NAmes"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
    TITLE "Log-Log: Edwards"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
    TITLE "Log-Log: BrkSide"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    where NOT(Neighborhood="NAmes" OR Neighborhood="Edwards" OR Neighborhood="BrkSide");
    TITLE "Log-Log: OTHER Neighborhoods (Reference)"; 
run; quit;

proc sgplot data=dataset2;
    scatter x=LogGrLivArea y=LogSalePrice / Group=Neighborhood;
    TITLE "Log-Log: All Data"; 
run; quit;

/************ MODELS *******************************************/
/***** Log-Log Model
******
title 'Log-Log: Interaction Terms';
proc reg data = dataset2;
    model LogSalePrice = LogGrLivArea d1 d2 int1Log int2Log / clb VIF;
    output out=b p=yhat r=yresid cookd=cooksd h=lev;
run; quit;
*****/
title 'Log-Log: Centered Terms';
proc reg data = dataset2;
    model LogSalePrice = LogGrLivArea d1 d2 cent1Log cent2Log / clb VIF influence;
    output out=b p=yhat r=yresid cookd=cooksd h=lev;
run; quit;
proc print data = b; run;

/***** REPRINT FOR COMPARISON ****************/
/*  So we can compare with influence numbers */
proc print data = dataset2; run;
