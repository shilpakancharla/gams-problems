GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/20/18 14:06:47 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  SETS V/s,u,x,v,z,y/,
   2       A(V,V) /s.(u,x), u.(s,x,z,v), x.(u,z,y), z.(u,v,y), v.y/;
   3   
   4  ALIAS
   5      (V,i), (V,j);
   6   
   7  PARAMETERS
   8      S(V) 'net supplies for nodes' /s 1, y -1/,
   9      c(V,V) 'unit cost on arcs'
  10      /s.u  1
  11       s.x  3
  12       u.s  1
  13       u.x  3
  14       u.z  2
  15       u.v  4
  16       x.u  3
  17       x.z  1
  18       x.y  2
  19       z.u  3
  20       z.v  1
  21       z.y  3
  22       v.y  2/;
  23   
  24  VARIABLES
  25   
  26  totalCost, x(V,V);
  27   
  28  POSITIVE VARIABLE x;
  29   
  30  EQUATIONS
  31   
  32  balance(V), obj;
  33   
  34  balance(V).. sum(j$A(V,j), x(V,j)) - sum(i$A(i,V), x(i,V)) =e= S(V);
  35  obj.. totalCost =e= sum(A, c(A)*x(A));
  36   
  37  MODEL shortestpath /balance, obj/;
  38  SOLVE shortestpath USING LP MINIMIZING totalCost;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/20/18 14:06:47 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shortestpath Using LP From line 38


---- balance  =E=  

balance(s)..  x(s,u) + x(s,x) - x(u,s) =E= 1 ; (LHS = 0, INFES = 1 ****)
     
balance(u)..  - x(s,u) + x(u,s) + x(u,x) + x(u,v) + x(u,z) - x(x,u) - x(z,u)
      =E= 0 ; (LHS = 0)
     
balance(x)..  - x(s,x) - x(u,x) + x(x,u) + x(x,z) + x(x,y) =E= 0 ; (LHS = 0)
     
REMAINING 3 ENTRIES SKIPPED


---- obj  =E=  

obj..  totalCost - x(s,u) - 3*x(s,x) - x(u,s) - 3*x(u,x) - 4*x(u,v) - 2*x(u,z)
     
      - 3*x(x,u) - x(x,z) - 2*x(x,y) - 2*x(v,y) - 3*x(z,u) - x(z,v) - 3*x(z,y)
      =E= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/20/18 14:06:47 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shortestpath Using LP From line 38


---- totalCost  

totalCost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(s,u)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(s)
       -1       balance(u)
       -1       obj

x(s,x)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(s)
       -1       balance(x)
       -3       obj

x(u,s)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       -1       balance(s)
        1       balance(u)
       -1       obj

REMAINING 10 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/20/18 14:06:47 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shortestpath Using LP From line 38


MODEL STATISTICS

BLOCKS OF EQUATIONS           2     SINGLE EQUATIONS            7
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           14
NON ZERO ELEMENTS            40


GENERATION TIME      =        2.594 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        2.594 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/20/18 14:06:47 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shortestpath Using LP From line 38


               S O L V E      S U M M A R Y

     MODEL   shortestpath        OBJECTIVE  totalCost
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  38

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE                5.0000

 RESOURCE USAGE, LIMIT          7.437      1000.000
 ITERATION COUNT, LIMIT         4    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 2.95sec (det. 0.02 ticks)
Optimal solution found.
Objective :           5.000000


---- EQU balance  

     LOWER     LEVEL     UPPER    MARGINAL

s     1.000     1.000     1.000     1.000      
u      .         .         .         .         
x      .         .         .       -2.000      
v      .         .         .       -2.000      
z      .         .         .       -1.000      
y    -1.000    -1.000    -1.000    -4.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR totalCost      -INF      5.000     +INF       .         

---- VAR x  

       LOWER     LEVEL     UPPER    MARGINAL

s.u      .         .        +INF       .         
s.x      .        1.000     +INF       .         
u.s      .         .        +INF      2.000      
u.x      .         .        +INF      1.000      
u.v      .         .        +INF      2.000      
u.z      .         .        +INF      1.000      
x.u      .         .        +INF      5.000      
x.z      .         .        +INF      2.000      
x.y      .        1.000     +INF       .         
v.y      .         .        +INF       .         
z.u      .         .        +INF      4.000      
z.v      .         .        +INF       EPS       
z.y      .         .        +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.015 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst
