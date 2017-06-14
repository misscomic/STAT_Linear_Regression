data wine ;
input first $ count ;
datalines ;
1 22
2 10
;
proc freq data = wine ;
tables first / binomial (p = 0.5) ;
weight count ;
run ;


data smoke ;
input drug $ smoke $ count ;
datalines ;
Chantix N 155
Chantix Y 197
Bupropion N 97
Bupropion Y 232
Placebo N 61
Placebo Y 283
;
run ;

proc freq data = smoke ;
tables drug * smoke / expected chisq ;
weight count ;
run ;

data cocaine ;
input method $ use $ count ;
datalines ;
phone Y 168
phone N 632
personal Y 200
personal N 600
written Y 224
written N 576
;
run ;

proc freq data = cocaine ;
tables method * use / expected chisq ;
weight count ;
run ;
