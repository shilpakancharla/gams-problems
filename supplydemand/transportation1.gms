GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/18/18 22:29:36 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *transportation1.gms
   2   
   3  SETS I 'supply points' /s1*s3/, J 'demand points' /d1*d4/;
   4   
   5  PARAMETERS
   6   
   7           s(I) 'supply from each point'
   8                   /s1 5
   9                    s2 10
  10                    s3 15/,
  11           d(J) 'demand from each point'
  12                   /d1 12
  13                    d2 8
  14                    d3 4
  15                    d4 6/;
  16   
  17  TABLE
  18           unitCost(I, J)
  19                           d1      d2      d3      d4
  20                   s1       2       3       5       6
  21                   s2       2       1       3       5
  22                   s3       3       8       4       5;
  23   
  24  VARIABLES z, x(I,J);
  25   
  26  Positive variable x;
  27   
  28  EQUATIONS
  29  cost 'total cost that needs to be minimized',
  30  supply(I),
  31  demand(J);
  32   
  33  cost.. sum((I,J), unitCost(I,J)*x(I,J)) =e= z;
  34  supply(I).. sum(J, x(I,J)) =l= s(I);
  35  demand(J).. sum(I, x(I,J)) =g= d(J);
  36   
  37  MODEL transport /ALL/;
  38  SOLVE transport USING LP MINIMIZING z;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/18/18 22:29:36 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE transport Using LP From line 38


---- cost  =E=  total cost that needs to be minimized

cost..  - z + 2*x(s1,d1) + 3*x(s1,d2) + 5*x(s1,d3) + 6*x(s1,d4) + 2*x(s2,d1)
     
      + x(s2,d2) + 3*x(s2,d3) + 5*x(s2,d4) + 3*x(s3,d1) + 8*x(s3,d2)
     
      + 4*x(s3,d3) + 5*x(s3,d4) =E= 0 ; (LHS = 0)
     

---- supply  =L=  

supply(s1)..  x(s1,d1) + x(s1,d2) + x(s1,d3) + x(s1,d4) =L= 5 ; (LHS = 0)
     
supply(s2)..  x(s2,d1) + x(s2,d2) + x(s2,d3) + x(s2,d4) =L= 10 ; (LHS = 0)
     
supply(s3)..  x(s3,d1) + x(s3,d2) + x(s3,d3) + x(s3,d4) =L= 15 ; (LHS = 0)
     

---- demand  =G=  

demand(d1)..  x(s1,d1) + x(s2,d1) + x(s3,d1) =G= 12 ; (LHS = 0, INFES = 12 ****)
     
demand(d2)..  x(s1,d2) + x(s2,d2) + x(s3,d2) =G= 8 ; (LHS = 0, INFES = 8 ****)
     
demand(d3)..  x(s1,d3) + x(s2,d3) + x(s3,d3) =G= 4 ; (LHS = 0, INFES = 4 ****)
     
REMAINING ENTRY SKIPPED

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/18/18 22:29:36 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE transport Using LP From line 38


---- z  

z
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
       -1       cost


---- x  

x(s1,d1)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        2       cost
        1       supply(s1)
        1       demand(d1)

x(s1,d2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        3       cost
        1       supply(s1)
        1       demand(d2)

x(s1,d3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        5       cost
        1       supply(s1)
        1       demand(d3)

REMAINING 9 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/18/18 22:29:36 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE transport Using LP From line 38


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS            8
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           13
NON ZERO ELEMENTS            37


GENERATION TIME      =        0.328 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.328 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/18/18 22:29:36 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE transport Using LP From line 38


               S O L V E      S U M M A R Y

     MODEL   transport           OBJECTIVE  z
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  38

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE               83.0000

 RESOURCE USAGE, LIMIT          0.094      1000.000
 ITERATION COUNT, LIMIT         8    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.08sec (det. 0.02 ticks)
Optimal solution found.
Objective :          83.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU cost            .         .         .       -1.000      

  cost  total cost that needs to be minimized

---- EQU supply  

      LOWER     LEVEL     UPPER    MARGINAL

s1     -INF      5.000     5.000    -1.000      
s2     -INF     10.000    10.000    -1.000      
s3     -INF     15.000    15.000      .         

---- EQU demand  

      LOWER     LEVEL     UPPER    MARGINAL

d1    12.000    12.000     +INF      3.000      
d2     8.000     8.000     +INF      2.000      
d3     4.000     4.000     +INF      4.000      
d4     6.000     6.000     +INF      5.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR z              -INF     83.000     +INF       .         

---- VAR x  

         LOWER     LEVEL     UPPER    MARGINAL

s1.d1      .        5.000     +INF       .         
s1.d2      .         .        +INF      2.000      
s1.d3      .         .        +INF      2.000      
s1.d4      .         .        +INF      2.000      
s2.d1      .         .        +INF       EPS       
s2.d2      .        8.000     +INF       .         
s2.d3      .        2.000     +INF       .         
s2.d4      .         .        +INF      1.000      
s3.d1      .        7.000     +INF       .         
s3.d2      .         .        +INF      6.000      
s3.d3      .        2.000     +INF       .         
s3.d4      .        6.000     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\transportation1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\transportation1.lst
