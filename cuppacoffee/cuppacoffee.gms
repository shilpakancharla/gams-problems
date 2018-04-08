GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/08/18 14:10:40 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *cuppacoffee.gms
   2   
   3  *Robust Joe must consist 60-75% Sumatran beans & at least 10% Columbian be
      ans
   4  *Light Joe must consist 50-60% Brazilian beans & no more than 20% Sumatran
       beans
   5   
   6  SET I/Columbian, Brazilian, Sumatran/, J/Robust, Light/;
   7   
   8  PARAMETERS
   9           sellingPrice(J) "dollar per pound"/Robust 4.25, Light 3.95/,
  10           purchasePrice(I) "dollar per pound"/Columbian 1, Brazilian 0.85,
  11  Sumatran 1.55/,
  12           supply(I) "in pounds" /Columbian 550, Brazilian 450, Sumatran 650
      /;
  13   
  14  VARIABLES
  15   
  16  profit "total profit";
  17   
  18  positive variables x;
  19   
  20  EQUATIONS
  21   
  22  obj "max total profit",
  23  limSupply(I) "limit on supply",
  24  RS1 "Robust has at least 60 percent of Sumatran",
  25  RS2 "Robust has at most 75 percent of Sumatran",
  26  RC "Robust has at least 10 percent of Columbian",
  27  LB1 "Light has at least 50 percent of Brazilian",
  28  LB2 "Light has at most 60 percent of Brazilian",
  29  LS "Light has at most 20 percent of Sumatran";
  30   
  31  obj.. profit =e= sum((I,J), (sellingPrice(J)-purchasePrice(I))*x(I,J));
  32  limSupply(I).. sum(J, x(I,J)) =l= supply(I);
  33  RS1.. x("Sumatran","Robust") =g= 0.6*sum(I, x(I,"Robust"));
  34  RS2.. x("Sumatran","Robust") =l= 0.75*sum(I, x(I,"Robust"));
  35  RC.. x("Columbian","Robust") =g= 0.1*sum(I, x(I,"Robust"));
  36  LB1.. x("Brazilian","Light") =g= 0.5*sum(I, x(I,"Light"));
  37  LB2.. x("Brazilian","Light") =l= 0.6*sum(I, x(I,"Light"));
  38  LS.. x("Sumatran","Light") =l= 0.2*sum(I, x(I,"Light"));
  39   
  40  Model blending /all/;
  41  Solve blending using lp maximizing profit;
  42   
  43   
  44   


COMPILATION TIME     =        0.016 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/08/18 14:10:40 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE blending Using LP From line 41


---- obj  =E=  max total profit

obj..  profit - 3.25*x(Columbian,Robust) - 2.95*x(Columbian,Light)
     
      - 3.4*x(Brazilian,Robust) - 3.1*x(Brazilian,Light)
     
      - 2.7*x(Sumatran,Robust) - 2.4*x(Sumatran,Light) =E= 0 ; (LHS = 0)
     

---- limSupply  =L=  limit on supply

limSupply(Columbian)..  x(Columbian,Robust) + x(Columbian,Light) =L= 550 ;
     
      (LHS = 0)
     
limSupply(Brazilian)..  x(Brazilian,Robust) + x(Brazilian,Light) =L= 450 ;
     
      (LHS = 0)
     
limSupply(Sumatran)..  x(Sumatran,Robust) + x(Sumatran,Light) =L= 650 ;
     
      (LHS = 0)
     

---- RS1  =G=  Robust has at least 60 percent of Sumatran

RS1..  - 0.6*x(Columbian,Robust) - 0.6*x(Brazilian,Robust)
     
      + 0.4*x(Sumatran,Robust) =G= 0 ; (LHS = 0)
     

---- RS2  =L=  Robust has at most 75 percent of Sumatran

RS2..  - 0.75*x(Columbian,Robust) - 0.75*x(Brazilian,Robust)
     
      + 0.25*x(Sumatran,Robust) =L= 0 ; (LHS = 0)
     

---- RC  =G=  Robust has at least 10 percent of Columbian

RC..  0.9*x(Columbian,Robust) - 0.1*x(Brazilian,Robust) - 0.1*x(Sumatran,Robust)
      =G= 0 ; (LHS = 0)
     

---- LB1  =G=  Light has at least 50 percent of Brazilian

LB1..  - 0.5*x(Columbian,Light) + 0.5*x(Brazilian,Light) - 0.5*x(Sumatran,Light)
      =G= 0 ; (LHS = 0)
     

---- LB2  =L=  Light has at most 60 percent of Brazilian

LB2..  - 0.6*x(Columbian,Light) + 0.4*x(Brazilian,Light) - 0.6*x(Sumatran,Light)
      =L= 0 ; (LHS = 0)
     

---- LS  =L=  Light has at most 20 percent of Sumatran

LS..  - 0.2*x(Columbian,Light) - 0.2*x(Brazilian,Light) + 0.8*x(Sumatran,Light)
      =L= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/08/18 14:10:40 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE blending Using LP From line 41


---- profit  total profit

profit
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(Columbian,Robust)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -3.25    obj
        1       limSupply(Columbian)
       -0.6     RS1
       -0.75    RS2
        0.9     RC

x(Columbian,Light)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -2.95    obj
        1       limSupply(Columbian)
       -0.5     LB1
       -0.6     LB2
       -0.2     LS

x(Brazilian,Robust)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -3.4     obj
        1       limSupply(Brazilian)
       -0.6     RS1
       -0.75    RS2
       -0.1     RC

REMAINING 3 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/08/18 14:10:40 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE blending Using LP From line 41


MODEL STATISTICS

BLOCKS OF EQUATIONS           8     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           2     SINGLE VARIABLES            7
NON ZERO ELEMENTS            31


GENERATION TIME      =        0.172 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.172 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/08/18 14:10:40 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE blending Using LP From line 41


               S O L V E      S U M M A R Y

     MODEL   blending            OBJECTIVE  profit
     TYPE    LP                  DIRECTION  MAXIMIZE
     SOLVER  CPLEX               FROM LINE  41

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE             4902.5000

 RESOURCE USAGE, LIMIT          0.234      1000.000
 ITERATION COUNT, LIMIT         5    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.08sec (det. 0.02 ticks)
Optimal solution found.
Objective :        4902.500000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

  obj  max total profit

---- EQU limSupply  limit on supply

             LOWER     LEVEL     UPPER    MARGINAL

Columbian     -INF    550.000   550.000     2.950      
Brazilian     -INF    450.000   450.000     3.100      
Sumatran      -INF    650.000   650.000     2.900      

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU RS1             .         .        +INF     -0.500      
---- EQU RS2            -INF   -162.500      .         .         
---- EQU RC              .      158.333     +INF       .         
---- EQU LB1             .         .        +INF  -7.77E-16      
---- EQU LB2            -INF    -56.667      .         .         
---- EQU LS             -INF   -113.333      .         .         

  RS1  Robust has at least 60 percent of Sumatran
  RS2  Robust has at most 75 percent of Sumatran
  RC  Robust has at least 10 percent of Columbian
  LB1  Light has at least 50 percent of Brazilian
  LB2  Light has at most 60 percent of Brazilian
  LS  Light has at most 20 percent of Sumatran

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR profit         -INF   4902.500     +INF       .         

  profit  total profit

---- VAR x  

                    LOWER     LEVEL     UPPER    MARGINAL

Columbian.Robust      .      266.667     +INF       .         
Columbian.Light       .      283.333     +INF       .         
Brazilian.Robust      .      166.667     +INF       .         
Brazilian.Light       .      283.333     +INF       .         
Sumatran .Robust      .      650.000     +INF       .         
Sumatran .Light       .         .        +INF     -0.500      


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\cuppacoffee.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\cuppacoffee.lst
