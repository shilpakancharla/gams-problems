GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:13:08 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *cake.gms
   2   
   3  SET I 'types of cakes' /cc, bf/, T 'months'/1*3/;
   4   
   5  SCALAR
   6   
   7  upbdd 'upper bdd for numer of cakes produced each month' /65/;
   8   
   9  PARAMETERS
  10   
  11  a(I) 'holding cost in dollars'
  12           /cc 0.5,
  13            bf 0.4/;
  14   
  15  TABLE d(I,T) 'demand of each type in each month'
  16   
  17           1       2       3
  18  cc       40      30      20
  19  bf       20      30      10;
  20   
  21  TABLE c(I,T) 'cost in dollars for each type in each month'
  22   
  23           1       2       3
  24  cc       3.25    3.45    3.90
  25  bf       2.75    2.95    3.45;
  26   
  27  VARIABLES
  28   
  29  cost 'total cost';
  30   
  31  positive variables x(I,T) 'number of cakes of type i in month t'
  32                     b(I,T) 'number of cakes of type i left in inventory at 
      end of month t';
  33   
  34  EQUATIONS
  35   
  36  obj 'objective function',
  37  upbddDef(T) 'number of cakes produced each month cannot exced the upper bd
      d',
  38  inventory(I,T) 'relation between inventory from different months';
  39   
  40  obj.. cost =e= sum((I,T), c(I,T)*x(I,T) + a(I)*b(I,T));
  41  upbddDef(T).. sum(I, x(I,T)) =l= upbdd;
  42  inventory(I,T).. x(I,T)+b(I,T-1)$(ord(T)>1)-d(I,T) =e= b(I,T);
  43   
  44  model cake /all/;
  45  solve cake using lp minimizing cost;
  46   
  47   
  48   
  49   


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:13:08 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE cake Using LP From line 45


---- obj  =E=  objective function

obj..  cost - 3.25*x(cc,1) - 3.45*x(cc,2) - 3.9*x(cc,3) - 2.75*x(bf,1)
     
      - 2.95*x(bf,2) - 3.45*x(bf,3) - 0.5*b(cc,1) - 0.5*b(cc,2) - 0.5*b(cc,3)
     
      - 0.4*b(bf,1) - 0.4*b(bf,2) - 0.4*b(bf,3) =E= 0 ; (LHS = 0)
     

---- upbddDef  =L=  number of cakes produced each month cannot exced the upper b
                    dd

upbddDef(1)..  x(cc,1) + x(bf,1) =L= 65 ; (LHS = 0)
     
upbddDef(2)..  x(cc,2) + x(bf,2) =L= 65 ; (LHS = 0)
     
upbddDef(3)..  x(cc,3) + x(bf,3) =L= 65 ; (LHS = 0)
     

---- inventory  =E=  relation between inventory from different months

inventory(cc,1)..  x(cc,1) - b(cc,1) =E= 40 ; (LHS = 0, INFES = 40 ****)
     
inventory(cc,2)..  x(cc,2) + b(cc,1) - b(cc,2) =E= 30 ;
     
      (LHS = 0, INFES = 30 ****)
     
inventory(cc,3)..  x(cc,3) + b(cc,2) - b(cc,3) =E= 20 ;
     
      (LHS = 0, INFES = 20 ****)
     
REMAINING 3 ENTRIES SKIPPED

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:13:08 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE cake Using LP From line 45


---- cost  total cost

cost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  number of cakes of type i in month t

x(cc,1)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -3.25    obj
        1       upbddDef(1)
        1       inventory(cc,1)

x(cc,2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -3.45    obj
        1       upbddDef(2)
        1       inventory(cc,2)

x(cc,3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -3.9     obj
        1       upbddDef(3)
        1       inventory(cc,3)

REMAINING 3 ENTRIES SKIPPED

---- b  number of cakes of type i left in inventory at end of month t

b(cc,1)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -0.5     obj
       -1       inventory(cc,1)
        1       inventory(cc,2)

b(cc,2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -0.5     obj
       -1       inventory(cc,2)
        1       inventory(cc,3)

b(cc,3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -0.5     obj
       -1       inventory(cc,3)

REMAINING 3 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:13:08 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE cake Using LP From line 45


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           3     SINGLE VARIABLES           13
NON ZERO ELEMENTS            35


GENERATION TIME      =        0.640 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.640 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/16/18 23:13:08 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE cake Using LP From line 45


               S O L V E      S U M M A R Y

     MODEL   cake                OBJECTIVE  cost
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  45

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE              489.0000

 RESOURCE USAGE, LIMIT          0.094      1000.000
 ITERATION COUNT, LIMIT         5    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.08sec (det. 0.02 ticks)
Optimal solution found.
Objective :         489.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

  obj  objective function

---- EQU upbddDef  number of cakes produced each month cannot exced the upper bd
                   d

     LOWER     LEVEL     UPPER    MARGINAL

1     -INF     60.000    65.000      .         
2     -INF     65.000    65.000    -0.100      
3     -INF     25.000    65.000      .         

---- EQU inventory  relation between inventory from different months

        LOWER     LEVEL     UPPER    MARGINAL

cc.1    40.000    40.000    40.000     3.250      
cc.2    30.000    30.000    30.000     3.550      
cc.3    20.000    20.000    20.000     3.900      
bf.1    20.000    20.000    20.000     2.750      
bf.2    30.000    30.000    30.000     3.050      
bf.3    10.000    10.000    10.000     3.450      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR cost           -INF    489.000     +INF       .         

  cost  total cost

---- VAR x  number of cakes of type i in month t

        LOWER     LEVEL     UPPER    MARGINAL

cc.1      .       40.000     +INF       .         
cc.2      .       30.000     +INF       .         
cc.3      .       20.000     +INF       .         
bf.1      .       20.000     +INF       .         
bf.2      .       35.000     +INF       .         
bf.3      .        5.000     +INF       .         

---- VAR b  number of cakes of type i left in inventory at end of month t

        LOWER     LEVEL     UPPER    MARGINAL

cc.1      .         .        +INF      0.200      
cc.2      .         .        +INF      0.150      
cc.3      .         .        +INF      4.400      
bf.1      .         .        +INF      0.100      
bf.2      .        5.000     +INF       .         
bf.3      .         .        +INF      3.850      


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\cake.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\cake.lst
