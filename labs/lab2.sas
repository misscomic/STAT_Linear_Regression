data billion ;
input wlth age region $ ;
datalines ;
37 50 M
24 88 U
14 64 A
13 63 U
13 66 U
11.7 72 E
10.0 71 M
8.2 77 U
8.1 68 U
7.2 66 E
7.0 69 M
6.2 36 O
5.9 49 U
5.3 73 U
5.2 52 E
5.0 77 M
5.0 73 M
4.9 62 A
4.8 54 U
4.7 63 U
4.7 23 U
4.6 70 O
4.6 59 E
4.5 96 E
4.5 84 O
4.5 40 E
4.3 60 U
4.0 77 E
4.0 68 E
4.0 83 E
4.0 68 A
4.0 40 E
4.0 62 M
4.0 69 E
4.0 49 A
3.9 64 A
3.9 83 A
3.8 41 A
3.8 78 A
3.6 80 A
3.5 68 O
3.4 67 U
3.4 71 O
3.4 54 A
3.3 62 E
3.3 69 A
3.3 58 U
3.2 71 U
3.2 55 O
3.0 66 E
3.0 65 E
3.0 50 U
3.0 64 E
3.0 57 A
3.0 86 M
3.0 71 E
3.0 68 E
3.0 68 E
3.00 54 U
2.8 68 A
2.8 76 E
2.8 52 E
2.8 73 O
2.8 46 O
2.7 69 U
2.7 63 E
2.6 42 E
2.6 67 E
2.6 62 O
2.6 66 U
2.6 75 U
2.5 74 E
2.5 73 E
2.5 84 M
2.5 49 A
2.4 60 U
2.4 71 O
2.4 76 A
2.4 67 E
2.3 54 A
2.3 57 U
2.3 54 O
2.3 64 O
2.2 85 E
2.2 45 A
2.2 39 O
2.2 54 E
2.1 68 U
2.1 85 U
2.0 70 M
2.0 102 M
2.0 38 U
2.0 73 A
2.0 91 E
2.0 82 U
2.0 74 M
2.0 81 M
2.0  . U
2.0 62 E
2.0 62 U
2.0 67 U
2.0 80 O
2.0 68 M
2.0 80 U
2.0 . U
2.0 60 E
2.0 74 O
1.9 48 U
1.9 60 E
1.9 43 E
1.9 64 O
1.9 67 U
1.8 62 A
1.8 90 E
1.8 66 U
1.8 68 A
1.8 60 A
1.8 53 A
1.8 47 E
1.8 86 U
1.8 67 A
1.7 54 U
1.7 77 E
1.7 61 U
1.7 83 E
1.7 61 U
1.7 58 U
1.7 64 U
1.7 53 A
1.7 67 A
1.6 57 E
1.6 62 A
1.6 . E
1.6 64 O
1.6 69 A
1.6 71 E
1.6 54 U
1.6 78 A
1.5 45 U
1.5 69 U
1.5 59 U
1.5 . A
1.5 82 O
1.5 68 E
1.5 41 E
1.5 60 E
1.5 64 E
1.5 44 E
1.5 7 E
1.5 72 E
1.5 56 E
1.5 60 E
1.4 61 E
1.4 79 O
1.4 42 O
1.4 63 E
1.4 49 E
1.4 56 E
1.4 67 U
1.4 75 E
1.4 43 M
1.4 61 U
1.4 54 O
1.4 47 E
1.4 64 U
1.4 52 A
1.4 73 A
1.3 83 U
1.3 64 E
1.3 71 O
1.3 71 E
1.3 61 M
1.3 83 E
1.3 43 E
1.3 47 U
1.3 79 E
1.3 53 E
1.3 73 U
1.3 72 U
1.3 72 U
1.3 59 A
1.3 77 E
1.3 68 E
1.3 42 E
1.3 61 U
1.2 69 A
1.2 82 O
1.2 . E
1.2 56 U
1.2 42 M
1.2 63 U
1.2 75 U
1.2 . E
1.2 59 A
1.2 70 E
1.2 46 M
1.2 68 U
1.2 68 A
1.2 69 A
1.2 68 O
1.2 64 A
1.1 53 E
1.1 79 E
1.1 49 E
1.1 47 U
1.1 75 U
1.1 76 M
1.1 66 U
1.1 85 U
1.1 66 O
1.1 70 U
1.1 58 E
1.1 72 E
1.1 52 M
1.0 52 O
1.0 79 E
1.0 69 A
1.0 52 M
1.0 75 E
1.0 62 E
1.0 65 M 
1.0 63 U
1.0 87 E
1.0 61 U
1 58 O
1 60 E
1 67 O
1 80 E
1 63 U
1 9 M
1 59 E
1 . E
1 . O
;
run ;

* Sorting a dataset *
**********************
* Note: If we want to produce separate output for different subsets of
* a dataset, we must first sort the dataset by the variable that
* defines those subsets ;
proc sort data = billion ;
by region ;
run ;

* Producing separate analysis for *
* each region *
*********************************** ;
* Note: In addition to a complete univariate analysis within each
* region, this procedure produces side-by-side boxplots of wealth
* by region ;
proc univariate plot data = billion ;
var wlth ;
by region ;
run ;

* Producing a scatterplot *
*************************** ;
* Note: the following code plots wlth on the y-axis and age on the x-axis;
proc plot data = billion ;
plot wlth * age ;
run ;

****************************
* Reading the OECD dataset *
* into SAS *
**************************** ;
* Note: the "13." in the "input" statement tells SAS the number of
* characters in the longest country name. Without this information,
* SAS would truncate the country names to 8 letters each ;
data OECD ;
input country $ 13. pcgdp pch beds los docs infmort ;
datalines ;
Australia     22689  1775   8.7  15.5  2.5  0.6   Asia
Austria       23985  1748   9.2  10.5  2.8  0.5   Eur
Belgium       24097  1708   7.2  11.3  3.4  0.6   Eur
Canada        24468  2065   5.1  12.0  2.1  0.6   Amer
CzechRepub    13137   904   9.2  12.3  2.9  0.6   Eur
Denmark       26280  1802   4.9   7.3  2.9  0.5   Eur
Finland       21659  1380   9.2  11.6  2.8  0.4   Eur
France        22091  2002   8.7  11.2  2.9  0.5   Eur
Germany       22835  2278   9.6  14.3  3.4  0.5   Eur
Greece        14463   888   5.0   8.2  3.9  0.7   Eur
Hungary       10524   602   9.3  10.8  4.2  1.1   Eur
Iceland       26296  1893   14.8 16.8  3.0  0.4   Eur
Ireland       22509  1276   3.7   7.0  2.1  0.6   Eur
Italy         21739  1584   6.0   9.8  5.5  0.6   Eur
Japan         24109  1677  16.2  43.7  1.8  0.4   Asia
Korea         13540   537   4.6  13.0  1.1  0.9   Asia
Luxembourg    34536  2139  10.7  15.3  2.2  0.5   Eur
Mexico         7998   358   1.1   4.1  1.5  1.7   Amer
Netherlands   23082  1766  11.2  32.5  2.6  0.5   Eur
NewZealand    17712  1270   6.8   6.5  2.1  0.7   Asia
Norway        27497  1928  15.0   9.9  2.8  0.4   Eur
Poland         7986   371   5.5  10.6  2.4  1.2   Eur
Portugal      15266  1071   4.1   9.8  3.0  0.7   Eur 
Spain         16740  1115   4.0  11.0  4.2  0.5   Eur
Sweden        21213  1675   5.6   7.5  3.1  0.4   Eur
Switzerland   26586  2499  20.6  25.2  3.2  0.5   Eur
Turkey         6720   232   2.5   6.3  1.1  4.2   Eur
UnitedKingdom 21170  1317   4.5   9.8  1.6  0.6   Eur
UnitedStates  30514  3898   4.0   7.8  2.6  0.8   Amer
predict       20000    .      .     .    .   .    Eur
run ;

* Better text scatter plots *
***************************** ;
proc plot data = OECD ;
plot pch * pcgdp = '.' / vpos = 20 hpos = 40;
run ;

* Correlation *
*************** ;
proc corr data = OECD ;
var pcgdp pch ;
run ;

* Regression *
************** ;
proc reg data = OECD ;
model pch = pcgdp ; * model <resp vbl> = <explanatory vbl> ;
id country ;
* identifies observations in list of predicted
values and residuals ;
run ;

* Predicted values *
* and residuals *
********************
* Note: the "p" option on the "model" statement gets list of
* predicted values and residuals ;
proc reg data = OECD ;
model pch = pcgdp / p ;
id country ;
run ;
