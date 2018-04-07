GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 16:19:15 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *Erica.gms
   2   
   3  variables
   4  x1 "amount invested in stocks",
   5  x2 "amount invested in loans",
   6  profit "total profit";
   7   
   8  positive variables x1, x2;
   9   
  10  equations
  11  obj "max total profit",
  12  total "total amount available",
  13  stock "dollars in stocks",
  14  loan "dollars in loans";
  15   
  16  obj.. profit =e= .10*x1 + .15*x2;
  17   
  18  total.. x1 + x2 =l= 1000;
  19   
  20  stock.. 0.3*x2 - 0.7*x1 =l= 0;
  21   
  22  loan.. x2 =g= 400;
  23   
  24  model Erica /all/;
  25  solve Erica using lp maximizing profit;


COMPILATION TIME     =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 16:19:15 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE Erica Using LP From line 25


---- obj  =E=  max total profit

obj..  - 0.1*x1 - 0.15*x2 + profit =E= 0 ; (LHS = 0)
     

---- total  =L=  total amount available

total..  x1 + x2 =L= 1000 ; (LHS = 0)
     

---- stock  =L=  dollars in stocks

stock..  - 0.7*x1 + 0.3*x2 =L= 0 ; (LHS = 0)
     

---- loan  =G=  dollars in loans

loan..  x2 =G= 400 ; (LHS = 0, INFES = 400 ****)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 16:19:15 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE Erica Using LP From line 25


---- x1  amount invested in stocks

x1
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -0.1     obj
        1       total
       -0.7     stock


---- x2  amount invested in loans

x2
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -0.15    obj
        1       total
        0.3     stock
        1       loan


---- profit  total profit

profit
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 16:19:15 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE Erica Using LP From line 25


MODEL STATISTICS

BLOCKS OF EQUATIONS           4     SINGLE EQUATIONS            4
BLOCKS OF VARIABLES           3     SINGLE VARIABLES            3
NON ZERO ELEMENTS             8


GENERATION TIME      =        0.188 SECONDS      3 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.188 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/07/18 16:19:15 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE Erica Using LP From line 25


               S O L V E      S U M M A R Y

     MODEL   Erica               OBJECTIVE  profit
     TYPE    LP                  DIRECTION  MAXIMIZE
     SOLVER  CPLEX               FROM LINE  25

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE              135.0000

 RESOURCE USAGE, LIMIT          0.219      1000.000
 ITERATION COUNT, LIMIT         0    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.06sec (det. 0.00 ticks)
Optimal solution found.
Objective :         135.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      
---- EQU total          -INF   1000.000  1000.000     0.135      
---- EQU stock          -INF       .         .        0.050      
---- EQU loan         400.000   700.000     +INF       .         

  obj  max total profit
  total  total amount available
  stock  dollars in stocks
  loan  dollars in loans

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR x1              .      300.000     +INF       .         
---- VAR x2              .      700.000     +INF       .         
---- VAR profit         -INF    135.000     +INF       .         

  x1  amount invested in stocks
  x2  amount invested in loans
  profit  total profit


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Erica.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Erica.lst
