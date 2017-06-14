data sublim ;
input group $ before after;
change = after - before;
datalines;
T  18 24
T  18 25
T  21 33
T  18 29
T  18 33
T  20 36
T  23 34
T  23 36
T  21 34
T  17 27
C  18 29
C  24 29
C  20 24
C  18 26
C  24 38
C  22 27
C  15 22
C  19 31
;
run;

proc sort data = sublim ;
by group ;
run ;

proc univariate plot data = sublim ;
var change ;
by group ;
run ;

proc ttest alpha = 0.10 data = sublim ;
class group ;
var change;
run ;


*****************prob 3*****************;
data bliss ;
input group $ number;
datalines;
A 29
A 28
A 24
A 31
A 15
A 24
A 27
A 23
A 20
A 22
A 23
A 21
A 24
A 35
A 21
A 24
A 44
A 28
A 17
A 21
A 21
A 20
A 28
A 16
P 16
P 14
P 17
P 15
P 26
P 17
P 12
P 25
P 21
P 20
P 18
P 21
P 20
P 16
P 18
P 15
P 26
P 15
P 13
P 17
P 21
P 19
P 15
P 12
;
run;

proc sort data = bliss ;
by group ;
run ;

proc univariate plot data = bliss ;
*check normality, look at the graph*;
var number;
by group;
run ;

proc ttest alpha = 0.10 data = bliss ;
class group ;
var number ;
run;

proc means n mean clm alpha= 0.10 data = bliss;
class group ;
var number ;
run ;

