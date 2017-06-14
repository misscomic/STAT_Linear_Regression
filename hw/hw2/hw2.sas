data wieners;
input type $ calories sodium; 
datalines ;
Beef    186     495
Beef    181     477
Beef    176     425
Beef    149     322
Beef    184     482
Beef    190     587
Beef    158     370
Beef    139     322
Beef    175     479
Beef    148     375
Beef    152     330
Beef    111     300
Beef    141     386
Beef    153     401
Beef    190     645
Beef    157     440
Beef    131     317
Beef    149     319
Beef    135     298
Beef    132     253
Meat    173     458
Meat    191     506
Meat    182     473
Meat    190     545
Meat    172     496
Meat    147     360
Meat    146     387
Meat    139     386
Meat    175     507
Meat    136     393
Meat    179     405
Meat    153     372
Meat    107     144
Meat    195     511
Meat    135     405
Meat    140     428
Meat    138     339
Poultry 129     430
Poultry 132     375
Poultry 102     396
Poultry 106     383
Poultry 94      387
Poultry 102     542
Poultry 87      359
Poultry 99      357
Poultry 107     528
Poultry 113     513
Poultry 135     426
Poultry 142     513
Poultry 86      358
Poultry 143     581
Poultry 152     588
Poultry 146     522
Poultry 144     545
;
run;

proc freq data=wieners;
tables type;
run;

proc gchart data=wieners ;
vbar type ;
title 'Hotdo types';
run;

proc univariate plot data=wieners;
var sodium;
run;

data salaries;
input salary; 
datalines ;
8000000
5000000
3833000
2500000
1350000
 875000
 637500
 550000
5750000
5000000
3250000
2250000
1300000
 875000
 600000
 500000
5500000
5000000
3250000
1500000
1000000
 875000
 600000
 500000
 ;
run;

proc univariate plot data=salaries;
var salary;
run;