data boneloss;
input change;
datalines ;
-4.7
-2.5
-4.9
-2.7
-0.8
-5.3
-8.3
-2.1
-6.8
-4.3
2.2
-7.8
-3.1
-1
-6.5
-1.8
-5.2
-5.7
-7
-2.2
-6.5
-1
-3
-3.6
-5.2
-2
-2.1
-5.6
-4.4
-3.3
-4
-4.9
-4.7
-3.8
-5.9
-2.5
-0.3
-6.2
-6.8
1.7
0.3
-2.3
0.4
-5.3
0.2
-2.2
-5.1
;
run;

proc means;
var change; * numeric variable for calculating statistics ;
run ;
proc means n mean clm ;
var change; * numeric variable for calculating statistics ;
run ;

proc means n mean clm alpha=0.1;
var change; * numeric variable for calculating statistics ;
run ;

data normtemp ;
input temp gender heart ;
datalines;
96.3    1    70
96.7    1    71
96.9    1    74
97.0    1    80
97.1    1    73
97.1    1    75
97.1    1    82
97.2    1    64
97.3    1    69
97.4    1    70
97.4    1    68
97.4    1    72
97.4    1    78
97.5    1    70
97.5    1    75
97.6    1    74
97.6    1    69
97.6    1    73
97.7    1    77
97.8    1    58
97.8    1    73
97.8    1    65
97.8    1    74
97.9    1    76
97.9    1    72
98.0    1    78
98.0    1    71
98.0    1    74
98.0    1    67
98.0    1    64
98.0    1    78
98.1    1    73
98.1    1    67
98.2    1    66
98.2    1    64
98.2    1    71
98.2    1    72
98.3    1    86
98.3    1    72
98.4    1    68
98.4    1    70
98.4    1    82
98.4    1    84
98.5    1    68
98.5    1    71
98.6    1    77
98.6    1    78
98.6    1    83
98.6    1    66
98.6    1    70
98.6    1    82
98.7    1    73
98.7    1    78
98.8    1    78
98.8    1    81
98.8    1    78
98.9    1    80
99.0    1    75
99.0    1    79
99.0    1    81
99.1    1    71
99.2    1    83
99.3    1    63
99.4    1    70
99.5    1    75
96.4    2    69
96.7    2    62
96.8    2    75
97.2    2    66
97.2    2    68
97.4    2    57
97.6    2    61
97.7    2    84
97.7    2    61
97.8    2    77
97.8    2    62
97.8    2    71
97.9    2    68
97.9    2    69
97.9    2    79
98.0    2    76
98.0    2    87
98.0    2    78
98.0    2    73
98.0    2    89
98.1    2    81
98.2    2    73
98.2    2    64
98.2    2    65
98.2    2    73
98.2    2    69
98.2    2    57
98.3    2    79
98.3    2    78
98.3    2    80
98.4    2    79
98.4    2    81
98.4    2    73
98.4    2    74
98.4    2    84
98.5    2    83
98.6    2    82
98.6    2    85
98.6    2    86
98.6    2    77
98.7    2    72
98.7    2    79
98.7    2    59
98.7    2    64
98.7    2    65
98.7    2    82
98.8    2    64
98.8    2    70
98.8    2    83
98.8    2    89
98.8    2    69
98.8    2    73
98.8    2    84
98.9    2    76
99.0    2    79
99.0    2    81
99.1    2    80
99.1    2    74
99.2    2    77
99.2    2    66
99.3    2    68
99.4    2    77
99.9    2    79
100.0   2    78
100.8   2    77
;
run;

proc univariate plot data = normtemp ;
*check normality, look at the histogram*;
var temp;
run ;

proc univariate mu0 = 98.6 data = normtemp ;
*the p-val is very small, we have enough evidence to reject the null hypothesis*;
var temp;
run ;

proc means n mean stddev clm alpha = .05 ;
*reject the null hypothesis*;
var temp ;
run ;

data smoking ;
input before after ;
*creating a new variable*;
diff = after - before ;
datalines ;
25	27	
25	29	
27	37	
44	56	
30	46	
67	82	
53	57	
53	80	
52	61	
60	59	
28	43	
;
run ;

proc univariate plot data = smoking ;
var diff ;
run ;

proc print;
run;

proc means data = smoking n mean stddev stderr clm alpha = .05 ;
*it's above 0, there's an increase.*;
var diff ;
run ;

proc ttest data = smoking ;
*no need to create "diff" *;
paired after*before ;
run ;


**********************example4**************************;
proc format ;
value grpfmt 1 = ’Teaching and Training’ 2 = ’Teaching’ 3 = ’Neither’ ;
run ;

data gulan ;
input score group ;
format group grpfmt. ; *use dot*;
datalines ;
156  1
119  1
107  1
108  1
100  1
170  1
130  1
154  1
107  1
137  1
107  1
132  2
105  2
144  2
136  2
132  2
159  2
152  2
117  2
 89  2
142  2
151  2
 82  2
110  3
117  3
124  3
106  3
113  3
 94  3
113  3
121  3
101  3
119  3
 77  3
 90  3
 66  3
 ;
 run;

 proc print;
 run;

proc univariate plot data=gulan;
var score;
by group;
run;

proc tabulate data = gulan ;
class group ; * class statement identifies qualitative variables ;
var score ; * var statement identifies quantitative variables ;
tables group , score * (n mean std) ;
run ;
