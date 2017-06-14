data borneo ;
input group trees species richness ;
datalines;
 1 27 22 0.81481
 1 22 18 0.81818
 1 29 22 0.75862
 1 21 20 0.95238
 1 19 15 0.78947
 1 33 21 0.63636
 1 16 13 0.8125
 1 20 13 0.65
 1 24 19 0.79167
 1 27 13 0.48148
 1 28 19 0.67857
 1 19 15 0.78947
 2 12 11 0.91667
 2 12 11 0.91667
 2 15 14 0.93333
 2 9 7 0.77778
 2 20 18 0.9
 2 18 15 0.83333
 2 17 15 0.88235
 2 14 12 0.85714
 2 14 13 0.92857
 2 2 2 1
 2 17 15 0.88235
 2 19 8 0.42105
 3 18 17 0.94444
 3 4 4 1
 3 22 18 0.81818
 3 15 14 0.93333
 3 18 18 1
 3 19 15 0.78947
 3 22 15 0.68182
 3 12 10 0.83333
 3 12 12 1
;
run ;
proc sort data = borneo ;
by group ;
run ;
proc univariate plot data = borneo ;
var richness ;
by group ;
run ;
proc means data = borneo ;
class group ;
var richness ;
run ;


data bro;
input group $ number ;
datalines;
C 11
C 13
C 16
C 15
C 15
C 11
C 12
N 15
N 14
N 15
N 16
N 17
N 18
N 17
N 13
P 14
P 14
P 14
P 11
P 13
P 12
P 15
P 15
NP 14
NP 16
NP 15
NP 14
NP 14
NP 13
NP 17
NP 14
;
run;
proc sort data = bro ;
by group;
run ;
proc univariate plot data = bro;
var number;
by group;
run;
proc means data = bro ;
var number ;
by group ;
run ;

proc anova data = bro ;
class group ;
model number = group ;
run ;

proc anova data =  borneo;
class group ;
model richness = group ;
run ;


