GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:26:41 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *company.gms
   2   
   3  SETS
   4   
   5           I 'warehouse' /w1, w2, w3, dummy/,
   6           J 'customer' /c1*c3/;
   7   
   8  *The total demand exceeds the total supply, add dummy supply point
   9  *with supply equal to total demand - total supply
  10  *Unit transportation cost from dummy supply will be penalty cost
  11   
  12  PARAMETERS
  13           s(I) 'supply of goods in units by warehouse'
  14                     /w1           30
  15                      w2           30
  16                      w3           30
  17                      dummy        40/,
  18           d(J) 'demand of goods in units by customer'
  19                     /c1           40
  20                      c2           50
  21                      c3           40/;
  22   
  23  TABLE price(I,J) 'costs of shipping 1 unit from each warehouse to each cus
      tomer'
  24   
  25                  c1              c2              c3
  26  w1              15              35              25
  27  w2              10              50              40
  28  w3              20              40              30
  29  dummy           70              75              65;
  30   
  31  VARIABLE
  32   
  33  cost 'total cost';
  34   
  35  positive variables x(I,J) 'amount of units transferred from each warehouse
       to each customer';
  36   
  37  EQUATIONS
  38   
  39  obj 'minimum transportation cost',
  40  supply(I) 'supply available',
  41  demand(J) 'demand by customers';
  42   
  43  obj.. cost =e= sum((I,J), price(I,J)*x(I,J));
  44  supply(I).. sum(J, x(I,J)) =e= s(I);
  45  demand(J).. sum(I, x(I,J)) =e= d(J);
  46   
  47  Model company /all/;
  48  Solve company using lp minimizing cost;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:26:41 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE company Using LP From line 48


---- obj  =E=  minimum transportation cost

obj..  cost - 15*x(w1,c1) - 35*x(w1,c2) - 25*x(w1,c3) - 10*x(w2,c1)
     
      - 50*x(w2,c2) - 40*x(w2,c3) - 20*x(w3,c1) - 40*x(w3,c2) - 30*x(w3,c3)
     
      - 70*x(dummy,c1) - 75*x(dummy,c2) - 65*x(dummy,c3) =E= 0 ; (LHS = 0)
     

---- supply  =E=  supply available

supply(w1)..  x(w1,c1) + x(w1,c2) + x(w1,c3) =E= 30 ; (LHS = 0, INFES = 30 ****)
     
supply(w2)..  x(w2,c1) + x(w2,c2) + x(w2,c3) =E= 30 ; (LHS = 0, INFES = 30 ****)
     
supply(w3)..  x(w3,c1) + x(w3,c2) + x(w3,c3) =E= 30 ; (LHS = 0, INFES = 30 ****)
     
REMAINING ENTRY SKIPPED


---- demand  =E=  demand by customers

demand(c1)..  x(w1,c1) + x(w2,c1) + x(w3,c1) + x(dummy,c1) =E= 40 ;
     
      (LHS = 0, INFES = 40 ****)
     
demand(c2)..  x(w1,c2) + x(w2,c2) + x(w3,c2) + x(dummy,c2) =E= 50 ;
     
      (LHS = 0, INFES = 50 ****)
     
demand(c3)..  x(w1,c3) + x(w2,c3) + x(w3,c3) + x(dummy,c3) =E= 40 ;
     
      (LHS = 0, INFES = 40 ****)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:26:41 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE company Using LP From line 48


---- cost  total cost

cost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  amount of units transferred from each warehouse to each customer

x(w1,c1)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -15       obj
        1       supply(w1)
        1       demand(c1)

x(w1,c2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -35       obj
        1       supply(w1)
        1       demand(c2)

x(w1,c3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
      -25       obj
        1       supply(w1)
        1       demand(c3)

REMAINING 9 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:26:41 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE company Using LP From line 48


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS            8
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           13
NON ZERO ELEMENTS            37


GENERATION TIME      =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:26:41 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE company Using LP From line 48


               S O L V E      S U M M A R Y

     MODEL   company             OBJECTIVE  cost
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  48

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE             4950.0000

 RESOURCE USAGE, LIMIT          0.047      1000.000
 ITERATION COUNT, LIMIT         3    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.03sec (det. 0.01 ticks)
Optimal solution found.
Objective :        4950.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

  obj  minimum transportation cost

---- EQU supply  supply available

         LOWER     LEVEL     UPPER    MARGINAL

w1       30.000    30.000    30.000    15.000      
w2       30.000    30.000    30.000    10.000      
w3       30.000    30.000    30.000    20.000      
dummy    40.000    40.000    40.000    55.000      

---- EQU demand  demand by customers

      LOWER     LEVEL     UPPER    MARGINAL

c1    40.000    40.000    40.000      .         
c2    50.000    50.000    50.000    20.000      
c3    40.000    40.000    40.000    10.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR cost           -INF   4950.000     +INF       .         

  cost  total cost

---- VAR x  amount of units transferred from each warehouse to each customer

            LOWER     LEVEL     UPPER    MARGINAL

w1   .c1      .         .        +INF       EPS       
w1   .c2      .       30.000     +INF       .         
w1   .c3      .         .        +INF       EPS       
w2   .c1      .       30.000     +INF       .         
w2   .c2      .         .        +INF     20.000      
w2   .c3      .         .        +INF     20.000      
w3   .c1      .       10.000     +INF       .         
w3   .c2      .       20.000     +INF       .         
w3   .c3      .         .        +INF       EPS       
dummy.c1      .         .        +INF     15.000      
dummy.c2      .         .        +INF       .         
dummy.c3      .       40.000     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\company.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\company.lst
