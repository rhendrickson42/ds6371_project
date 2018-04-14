FILENAME REFFILE '/home/rchandna0/train.csv';
 
PROC IMPORT DATAFILE=REFFILE
                DBMS=CSV
                OUT=WORK.KaggData replace;
                GETNAMES=YES;
RUN;
 
proc print data=Work.kaggdata;
run;
 
proc sgscatter data=Work.Kaggdata;
plot SalePrice*GrLivArea /group=Neighborhood ;
run;
 
data trainRed;
set Work.kaggdata(keep= Id Neighborhood  GrLivArea SalePrice);
select (Neighborhood);
                when("NAmes") Nei = Neighborhood;
                when("Edwards") Nei = "EdwardPlusBrkSide";
                when("BrkSide") Nei = "EdwardPlusBrkSide";
               otherwise Nei = "Others";
end;
if GrLivArea < 4500;
If GrLivArea > 0;
if SalePrice > 0;
logSales = log(SalePrice);
logLiv = log(GrLivArea);
if Nei = "NAmes" then d2 = 1; else d2 = 0;
if Nei = "Others" then d3 = 1; else d3 = 0;
/*int1 = d1 * GrLivArea; int2 = d2 * GrLivArea; int3 = d3 * GrLivArea;
l_int1 = d1 * logLiv; l_int2 = d2 * logLiv; l_int3 = d3 * logLiv;
centLint1 = (logLiv - 7.2660236) * (d1 - 0.0672154);*/
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
class Nei(ref = "BrkSide");
model SalePrice = GrLivArea | Nei / solution ;
run;
 
/*************---------------------------------------------------------*/
/* Looks Ok as compared to Previous */
proc glm data=trainRed plots=all;
class Nei(ref = "BrkSide");
model logSales = GrLivArea | Nei / solution;
run;
 
proc reg data=trainRed plots=all;
model logSales = GrLivArea d1 d2 d3 int1 int2 int3/VIF;
run;
/*************---------------------------------------------------------*/
 
proc glm data=trainRed plots=all;
class Nei(ref = "EdwardP");
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