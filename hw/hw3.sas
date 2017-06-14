data ebola;
input distance time;
datalines ;
1 0.57142857
3 3
4 4.71428571
4 5.85714286
4 6.14285714
5 6.57142857
;
run;

proc plot data=ebola;
plot time * distance = '.';
run;

proc corr data =ebola;
var time distance ;
run ;


