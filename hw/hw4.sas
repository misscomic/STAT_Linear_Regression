data wine;
input country $ consumption deaths;
datalines;
Australia       2.5   211
Austria         3.9   167
Belgium         2.9   131
Canada          2.4   191
Denmark         2.9   220
Finland         0.8   297
France          9.1    71
Iceland         0.8   211
Ireland         0.7   300
Italy           7.9   107
Netherla        1.8   167
NewZeala        1.9   266
Norway          0.8   227
Spain           6.5    86
Sweden          1.6   207
Switzerl        5.8   115
UK              1.3   285
USA             1.2   199
WestGerm        2.7   172
;
run;

proc sort data=wine;
by country;
run;

proc plot data = wine;
plot deaths*consumption = '.'/vpos = 20 hpos = 40;
run;

proc corr data = wine ;
var deaths consumption ;
run ;
