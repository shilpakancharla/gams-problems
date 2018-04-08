GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 23:13:56 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *cuppacoffe.gms
   2   
   3  SETS I/Columbian, Brazilian, Sumatran/, J /Robust, Light/;
   4   
   5  PARAMETERS
   6   
   7  A(I) "supply of each bean (pounds)"
   8           /       Columbian       550
   9                   Brazilian       450
  10                   Sumatran        650     /,
  11   
  12  B(J) "selling price and coffee price"
  13           /       Robust  4.25
  14                   Light   3.95    /;
  15   
  16   
  17  VARIABLES
  18   
  19  profit "total profit",
  20  x(I,J) "profit from each roast while observing amount available"
  21   
  22  positive variables x;
  23   
  24  EQUATIONS
  25  obj "total max profit",
  26  RS1 "Robust has at least 60 percent of Sumatran",
  27  RS2 "Robust has less than 75 percent of Sumatran",
  28  RC1 "Robust has at least 10 percent of Columbian",
  29  LB1 "Light has at least 50 percent of Brazilian",
  30  LB2 "Light has less than 60 percent of Brazilian",
  31  LS1 "Light has less than 20 percent of Sumatran";
  32   
  33   
  34  obj.. profit =e= sum((I,J), x(I,J));
  35  RS1.. x("Sumatran", "Robust") =g= 0.6*sum(I, x(I, "Robust"));
  36  RS2.. x("Sumatran", "Robust") =l= 0.75*sum(I, x(I, "Robust"));
  37  RC1.. x("Columbian", "Robust") =g= 0.1*sum(I, x(I, "Robust"));
  38  LB1.. x("Brazilian", "Light") =g= .5*sum(I, x(I, "Light"));
  39  LB2.. x("Brazilian", "Light") =l= .6*sum(I, x(I, "Light"));
  40  LS1.. x("Sumatran", "Light") =l= .2*sum(I, x(I, "Light"));
  41   
  42  Model cuppacoffee /all/;
  43  Solve cuppacoffee using LP maximizing profit;
  44   
  45   
  46   
  47   
  48   
  49   
  50   
  51   
  52   


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 23:13:56 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE cuppacoffee Using LP From line 43


---- obj  =E=  total max profit

obj..  profit - x(Columbian,Robust) - x(Columbian,Light) - x(Brazilian,Robust)
     
      - x(Brazilian,Light) - x(Sumatran,Robust) - x(Sumatran,Light) =E= 0 ;
     
      (LHS = 0)
     

---- RS1  =G=  Robust has at least 60 percent of Sumatran

RS1..  - 0.6*x(Columbian,Robust) - 0.6*x(Brazilian,Robust)
     
      + 0.4*x(Sumatran,Robust) =G= 0 ; (LHS = 0)
     

---- RS2  =L=  Robust has less than 75 percent of Sumatran

RS2..  - 0.75*x(Columbian,Robust) - 0.75*x(Brazilian,Robust)
     
      + 0.25*x(Sumatran,Robust) =L= 0 ; (LHS = 0)
     

---- RC1  =G=  Robust has at least 10 percent of Columbian

RC1..  0.9*x(Columbian,Robust) - 0.1*x(Brazilian,Robust)
     
      - 0.1*x(Sumatran,Robust) =G= 0 ; (LHS = 0)
     

---- LB1  =G=  Light has at least 50 percent of Brazilian

LB1..  - 0.5*x(Columbian,Light) + 0.5*x(Brazilian,Light) - 0.5*x(Sumatran,Light)
      =G= 0 ; (LHS = 0)
     

---- LB2  =L=  Light has less than 60 percent of Brazilian

LB2..  - 0.6*x(Columbian,Light) + 0.4*x(Brazilian,Light) - 0.6*x(Sumatran,Light)
      =L= 0 ; (LHS = 0)
     

---- LS1  =L=  Light has less than 20 percent of Sumatran

LS1..  - 0.2*x(Columbian,Light) - 0.2*x(Brazilian,Light) + 0.8*x(Sumatran,Light)
      =L= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 23:13:56 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE cuppacoffee Using LP From line 43


---- profit  total profit

profit
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  profit from each roast while observing amount available

x(Columbian,Robust)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -1       obj
       -0.6     RS1
       -0.75    RS2
        0.9     RC1

x(Columbian,Light)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -1       obj
       -0.5     LB1
       -0.6     LB2
       -0.2     LS1

x(Brazilian,Robust)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -1       obj
       -0.6     RS1
       -0.75    RS2
       -0.1     RC1

REMAINING 3 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 23:13:56 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE cuppacoffee Using LP From line 43


MODEL STATISTICS

BLOCKS OF EQUATIONS           7     SINGLE EQUATIONS            7
BLOCKS OF VARIABLES           2     SINGLE VARIABLES            7
NON ZERO ELEMENTS            25


GENERATION TIME      =        0.015 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.015 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 23:13:56 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE cuppacoffee Using LP From line 43


               S O L V E      S U M M A R Y

     MODEL   cuppacoffee         OBJECTIVE  profit
     TYPE    LP                  DIRECTION  MAXIMIZE
     SOLVER  CPLEX               FROM LINE  43

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      3 Unbounded                 
**** OBJECTIVE VALUE                0.0000

 RESOURCE USAGE, LIMIT          0.016      1000.000
 ITERATION COUNT, LIMIT         1    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(4): unbounded or infeasible
Cplex Time: 0.00sec (det. 0.00 ticks)
Presolve found the problem infeasible or unbounded.
Rerunning with presolve turned off and solving with LPMETHOD=0
LP status(2): unbounded
Cplex Time: 0.00sec (det. 0.00 ticks)
Model has an unbounded ray.

**** ERRORS/WARNINGS IN VARIABLE x(Sumatran,Robust)
     1 error(s): Unbounded variable

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      
---- EQU RS1             .         .        +INF     -1.667      
---- EQU RS2            -INF       .         .         .         
---- EQU RC1             .         .        +INF       .         
---- EQU LB1             .         .        +INF       .         
---- EQU LB2            -INF       .         .         .         
---- EQU LS1            -INF       .         .         .         

  obj  total max profit
  RS1  Robust has at least 60 percent of Sumatran
  RS2  Robust has less than 75 percent of Sumatran
  RC1  Robust has at least 10 percent of Columbian
  LB1  Light has at least 50 percent of Brazilian
  LB2  Light has less than 60 percent of Brazilian
  LS1  Light has less than 20 percent of Sumatran

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR profit         -INF       .        +INF       .         

  profit  total profit

---- VAR x  profit from each roast while observing amount available

                    LOWER     LEVEL     UPPER    MARGINAL

Columbian.Robust      .         .        +INF       .         
Columbian.Light       .         .        +INF      1.000  NOPT
Brazilian.Robust      .         .        +INF       EPS       
Brazilian.Light       .         .        +INF      1.000  NOPT
Sumatran .Robust      .         .        +INF      1.667 UNBND
Sumatran .Light       .         .        +INF      1.000  NOPT


**** REPORT SUMMARY :        3     NONOPT ( NOPT)
                             0 INFEASIBLE
                             1  UNBOUNDED (UNBND)


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\cuppacoffee.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\cuppacoffee.lst
