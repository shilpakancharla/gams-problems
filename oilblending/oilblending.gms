GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/09/18 14:04:25 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *oilblending.gms
   2   
   3  SETS I /regular, extra/, J/national, imported/;
   4   
   5  PARAMETERS
   6   
   7           sellingPrice(I) /regular 12, extra 14/,
   8           maxSteamPressure(I) /regular 23, extra 23/,
   9           octaneRating(I) /regular 88, extra 93/,
  10           maxDemand(I) /regular 100000, extra 20000/,
  11           minDelivery(I) /regular 50000, extra 5000/,
  12           steamPressure(J) /national 25, imported 15/,
  13           octaneRating2(J) /national 87, imported 98/,
  14           inventoryLimit(J) /national 40000, imported 60000/;
  15   
  16  VARIABLES
  17   
  18  WeeklyIncome "weekly income";
  19   
  20  positive variables x;
  21   
  22  EQUATIONS
  23   
  24  obj,
  25  SteamPressureConstr(I),
  26  MinOctaneConstr(I),
  27  MinDeliveryConstr(I),
  28  MaxDemandConstr(I),
  29  InventoryConstr(J);
  30   
  31  obj.. WeeklyIncome =e= sum(I, sellingPrice(I)*sum(J, x(I,J)));
  32  SteamPressureConstr(I).. sum(J, steamPressure(J)*x(I,J)) =l= maxSteamPress
      ure(I)*sum(J, x(I,J));
  33  MinOctaneConstr(I).. sum(J, octaneRating2(J)*x(I,J)) =g= octaneRating(I)*s
      um(J, x(I,J));
  34  MinDeliveryConstr(I).. sum(J, x(I,J)) =g= minDelivery(I);
  35  MaxDemandConstr(I).. sum(J, x(I,J)) =l= maxDemand(I);
  36  InventoryConstr(J).. sum(I, x(I,J)) =l= inventoryLimit(J);
  37   
  38  model OilBlending /all/;
  39  solve OilBlending using lp maximizing WeeklyIncome;
  40   


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/09/18 14:04:25 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE OilBlending Using LP From line 39


---- obj  =E=  

obj..  WeeklyIncome - 12*x(regular,national) - 12*x(regular,imported)
     
      - 14*x(extra,national) - 14*x(extra,imported) =E= 0 ; (LHS = 0)
     

---- SteamPressureConstr  =L=  

SteamPressureConstr(regular)..  2*x(regular,national) - 8*x(regular,imported)
      =L= 0 ; (LHS = 0)
     
SteamPressureConstr(extra)..  2*x(extra,national) - 8*x(extra,imported) =L= 0 ;
     
      (LHS = 0)
     

---- MinOctaneConstr  =G=  

MinOctaneConstr(regular)..  - x(regular,national) + 10*x(regular,imported) =G= 0
      ; (LHS = 0)
     
MinOctaneConstr(extra)..  - 6*x(extra,national) + 5*x(extra,imported) =G= 0 ;
     
      (LHS = 0)
     

---- MinDeliveryConstr  =G=  

MinDeliveryConstr(regular)..  x(regular,national) + x(regular,imported) =G= 
     50000 ; (LHS = 0, INFES = 50000 ****)
     
MinDeliveryConstr(extra)..  x(extra,national) + x(extra,imported) =G= 5000 ;
     
      (LHS = 0, INFES = 5000 ****)
     

---- MaxDemandConstr  =L=  

MaxDemandConstr(regular)..  x(regular,national) + x(regular,imported) =L= 100000
      ; (LHS = 0)
     
MaxDemandConstr(extra)..  x(extra,national) + x(extra,imported) =L= 20000 ;
     
      (LHS = 0)
     

---- InventoryConstr  =L=  

InventoryConstr(national)..  x(regular,national) + x(extra,national) =L= 40000 ;
     
      (LHS = 0)
     
InventoryConstr(imported)..  x(regular,imported) + x(extra,imported) =L= 60000 ;
     
      (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/09/18 14:04:25 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE OilBlending Using LP From line 39


---- WeeklyIncome  weekly income

WeeklyIncome
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(regular,national)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -12       obj
        2       SteamPressureConstr(regular)
       -1       MinOctaneConstr(regular)
        1       MinDeliveryConstr(regular)
        1       MaxDemandConstr(regular)
        1       InventoryConstr(national)

x(regular,imported)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -12       obj
       -8       SteamPressureConstr(regular)
       10       MinOctaneConstr(regular)
        1       MinDeliveryConstr(regular)
        1       MaxDemandConstr(regular)
        1       InventoryConstr(imported)

x(extra,national)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -14       obj
        2       SteamPressureConstr(extra)
       -6       MinOctaneConstr(extra)
        1       MinDeliveryConstr(extra)
        1       MaxDemandConstr(extra)
        1       InventoryConstr(national)

REMAINING ENTRY SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/09/18 14:04:25 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE OilBlending Using LP From line 39


MODEL STATISTICS

BLOCKS OF EQUATIONS           6     SINGLE EQUATIONS           11
BLOCKS OF VARIABLES           2     SINGLE VARIABLES            5
NON ZERO ELEMENTS            25


GENERATION TIME      =        0.047 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.047 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/09/18 14:04:25 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE OilBlending Using LP From line 39


               S O L V E      S U M M A R Y

     MODEL   OilBlending         OBJECTIVE  WeeklyIncome
     TYPE    LP                  DIRECTION  MAXIMIZE
     SOLVER  CPLEX               FROM LINE  39

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE          1240000.0000

 RESOURCE USAGE, LIMIT          0.078      1000.000
 ITERATION COUNT, LIMIT         6    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.08sec (det. 0.02 ticks)
Optimal solution found.
Objective :     1240000.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

---- EQU SteamPressureConstr  

           LOWER     LEVEL     UPPER    MARGINAL

regular     -INF  -2.400E+5      .         .         
extra       -INF  -1.600E+5      .         .         

---- EQU MinOctaneConstr  

           LOWER     LEVEL     UPPER    MARGINAL

regular      .    3.6000E+5     +INF       .         
extra        .    1.0000E+5     +INF       .         

---- EQU MinDeliveryConstr  

           LOWER     LEVEL     UPPER    MARGINAL

regular 50000.000 80000.000     +INF       .         
extra    5000.000 20000.000     +INF       .         

---- EQU MaxDemandConstr  

           LOWER     LEVEL     UPPER    MARGINAL

regular     -INF  80000.000 1.0000E+5      .         
extra       -INF  20000.000 20000.000     2.000      

---- EQU InventoryConstr  

            LOWER     LEVEL     UPPER    MARGINAL

national     -INF  40000.000 40000.000    12.000      
imported     -INF  60000.000 60000.000    12.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR WeeklyInc~     -INF  1.2400E+6     +INF       .         

  WeeklyIncome  weekly income

---- VAR x  

                    LOWER     LEVEL     UPPER    MARGINAL

regular.national      .    40000.000     +INF       .         
regular.imported      .    40000.000     +INF       .         
extra  .national      .         .        +INF       EPS       
extra  .imported      .    20000.000     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst
