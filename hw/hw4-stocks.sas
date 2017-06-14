data stock;
input year oversea us;
datalines;
1971  29.6  14.6
1972  36.3  18.9
1973 -14.9 -14.8
1974 -23.2 -26.4
1975  35.4  37.2
1976   2.5  23.6
1977  18.1  -7.4
1978  32.6   6.4
1979   4.8  18.2
1980  22.6  32.3
1981  -2.3  -5.0
1982  -1.9  21.5
1983  23.7  22.4
1984   7.4   6.1
1985  56.2  31.6
1986  69.4  18.6
1987  24.6   5.1
1988  28.5  16.8
1989  10.6  31.5
1990 -23.0  -3.1
1991  12.8  30.4
1992 -12.1   7.6
1993  32.9  10.1
1994   6.2   1.3
1995  11.2  37.6
1996   6.4  23.0
1997   2.1  33.4
;
run;

proc sort data=stock;
by year;
run;

proc plot data = stock;
plot oversea * us = '.'/vpos = 20 hpos = 40;
run;

proc corr data = stock ;
var oversea us ;
run ;

proc univariate plot data=stock;
var us;
run;

proc univariate plot data=stock;
var oversea;
run;

proc reg data=stock;
model oversea = us;
id year;
run;

