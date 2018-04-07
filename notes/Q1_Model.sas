filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/clean/qoi1.csv?token=AC0MhyXwsRezAsjo2cXdgjbC9E-tjp3wks5a0ANawA%3D%3D";
proc import datafile=CSV out=dataset
    (where = (Neighborhood = 'Edwards' OR Neighborhood = 'NAmes' OR Neighborhood = 'BrkSide'))
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
proc print data = dataset2 (obs=10); run;

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