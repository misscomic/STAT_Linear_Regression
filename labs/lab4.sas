data cloud ;
input rainfall seeded $ ;
lograin = log(rainfall) ;
datalines;
1202.6  U  
830.1   U
372.4   U
345.5   U
321.2   U
244.3   U
163.0   U
147.8   U
95.0    U
87.0    U
81.2    U
68.5    U  
47.3    U
41.1    U
36.6    U
29.0    U 
28.6    U
26.3    U 
26.1    U
24.4    U
21.7    U
17.3    U
11.5    U 
4.9     U
4.9     U
1.0     U
2745.6  S
1697.8  S
1656.0  S
978.0   S
 703.4  S
 489.1  S
 430.0  S
 334.1  S
 302.8  S
 274.7  S
 274.7  S
 255.0  S
 242.5  S
 200.7  S
 198.6  S
 129.6  S
 119.0  S
 118.3  S
 115.3  S
  92.4  S
  40.6  S
  32.7  S
  31.4  S
  17.5  S
   7.7  S
   4.1  S

;
run;

proc sort data=cloud;
by seeded;
run;

proc univariate plot data=cloud;
var rainfall lograin;
by seeded;
run;

proc ttest ;
*the t-test is 2.54 and p-value is 0.014;
*we also get a CI 95% for mean;
class seeded ;
var lograin ;
run;

*****************example2*********************;
data normtemp ;
input temp gender heart ;
format gender sexfmt. ;
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

proc format ;
value sexfmt 1 = ’M’ 2 = ’F’ ;
run ;

proc univariate mu0 = 98.6 data = normtemp ;
var temp;
run ;
