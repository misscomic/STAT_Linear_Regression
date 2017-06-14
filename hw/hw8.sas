data air;
input nitro;
datalines;
63.4 
65.0 
64.4 
63.3
54.8
64.5
60.8
49.1
51.0
;
run;

proc univariate plot data=air;
var nitro;
run;

proc means n mean stddev clm alpha = .1 ;
var nitro ;
run ;


data cell;
input baseline after;
diff = after-baseline;
datalines;
0.04 0.28
0.02 0.47
0.00 1.30
0.02 0.25
0.38 1.22
0.33 0.44
;
run;

proc univariate plot data = cell;
var diff;
run;


proc means data = cell n mean stddev stderr clm alpha = .05 ;
*it's above 0, there's an increase.*;
var diff ;
run ;

proc univariate mu0 = 0 data = cell ;
var diff;
run ;




