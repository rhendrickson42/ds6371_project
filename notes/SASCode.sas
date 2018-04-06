filename CSV URL "https://raw.githubusercontent.com/rhendrickson42/ds6371_project/master/data/clean/qoi1.csv?token=AC0MhyXwsRezAsjo2cXdgjbC9E-tjp3wks5a0ANawA%3D%3D";
    proc import datafile=CSV out=dataset dbms=CSV replace;
    getnames=yes;
    datarow=2;
run;

data dataset2;
    set dataset;
    if Neighborhood = 'Edwards' then d1=1; else d1=0;
    if Neighborhood = 'NAmes'   then d2=1; else d2=0;
    
    int1 = d1*GrLivArea;
    int2 = d2*GrLivArea;
    
    cent1 = (GrLivArea - 1301.83)*(d1 - 0.2610966)
    cent2 = (GrLivArea - 1301.83)*(d2 - 0.5874674)
run;
proc print data = dataset2 (obs=10); run;

proc means data=dataset2;
var GrLivArea d1 d2;
run;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="NAmes";
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="Edwards";
run; quit;

proc sgplot data=dataset2;
    scatter x=GrLivArea y=SalePrice / Group=Neighborhood;
    where Neighborhood="BrkSide";
run; quit;

proc reg data = dataset2;
model SalePrice = LogHeight d1 d2 cent1 cent2 / clb VIF;
run; quit;
