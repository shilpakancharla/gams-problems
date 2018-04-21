GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:14:24 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *route.gms
   2   
   3  SETS V/a,b,c,d,f,g,h,k,l,m,n/,
   4       A(V,V) /a.(b,c,d), b.(f,g), c.(d,f,g), d.(g,h), f.(g,k,n), g.(k,l),
   5               h.(l,m), k.(l,n), l.n, m.n/;
   6   
   7  ALIAS (V,i), (V,j);
   8   
   9  PARAMETERS
  10           S(V) 'net supplies for nodes' /a 1, n -1/,
  11           c(V,V) 'unit cost on arcs'
  12                   /a.b          5
  13                    a.c          2
  14                    a.d          4
  15                    b.f          3
  16                    b.g          4
  17                    c.d          3
  18                    c.f          4
  19                    c.g          8
  20                    d.g          6
  21                    d.h          3
  22                    f.g          2
  23                    f.k          9
  24                    f.n          10
  25                    g.k          12
  26                    g.l          9
  27                    h.l          9
  28                    h.m          11
  29                    k.l          6
  30                    k.n          10
  31                    l.n          4
  32                    m.n          7/;
  33   
  34  VARIABLES totalCost, x(V,V);
  35   
  36  POSITIVE VARIABLE x;
  37   
  38  EQUATIONS
  39   
  40  balance(V), obj;
  41   
  42  balance(V).. sum(j$A(V, j), x(V, j)) - sum(i$A(i, V), x(i, V)) =E= S(V);
  43  obj.. totalcost =E= sum(A, c(A)*x(A));
  44   
  45  MODEL route /balance, obj/;
  46  SOLVE route USING LP MINIMIZING totalCost;


COMPILATION TIME     =        0.016 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:14:24 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE route Using LP From line 46


---- balance  =E=  

balance(a)..  x(a,b) + x(a,c) + x(a,d) =E= 1 ; (LHS = 0, INFES = 1 ****)
     
balance(b)..  - x(a,b) + x(b,f) + x(b,g) =E= 0 ; (LHS = 0)
     
balance(c)..  - x(a,c) + x(c,d) + x(c,f) + x(c,g) =E= 0 ; (LHS = 0)
     
REMAINING 8 ENTRIES SKIPPED


---- obj  =E=  

obj..  totalCost - 5*x(a,b) - 2*x(a,c) - 4*x(a,d) - 3*x(b,f) - 4*x(b,g)
     
      - 3*x(c,d) - 4*x(c,f) - 8*x(c,g) - 6*x(d,g) - 3*x(d,h) - 2*x(f,g)
     
      - 9*x(f,k) - 10*x(f,n) - 12*x(g,k) - 9*x(g,l) - 9*x(h,l) - 11*x(h,m)
     
      - 6*x(k,l) - 10*x(k,n) - 4*x(l,n) - 7*x(m,n) =E= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:14:24 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE route Using LP From line 46


---- totalCost  

totalCost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(a,b)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(a)
       -1       balance(b)
       -5       obj

x(a,c)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(a)
       -1       balance(c)
       -2       obj

x(a,d)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(a)
       -1       balance(d)
       -4       obj

REMAINING 18 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:14:24 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE route Using LP From line 46


MODEL STATISTICS

BLOCKS OF EQUATIONS           2     SINGLE EQUATIONS           12
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           22
NON ZERO ELEMENTS            64


GENERATION TIME      =        0.016 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.016 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:14:24 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE route Using LP From line 46


               S O L V E      S U M M A R Y

     MODEL   route               OBJECTIVE  totalCost
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  46

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE               16.0000

 RESOURCE USAGE, LIMIT          0.016      1000.000
 ITERATION COUNT, LIMIT         3    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.02sec (det. 0.02 ticks)
Optimal solution found.
Objective :          16.000000


---- EQU balance  

     LOWER     LEVEL     UPPER    MARGINAL

a     1.000     1.000     1.000     6.000      
b      .         .         .        1.000      
c      .         .         .        4.000      
d      .         .         .        2.000      
f      .         .         .         EPS       
g      .         .         .         .         
h      .         .         .       -1.000      
k      .         .         .         .         
l      .         .         .       -6.000      
m      .         .         .       -3.000      
n    -1.000    -1.000    -1.000   -10.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR totalCost      -INF     16.000     +INF       .         

---- VAR x  

       LOWER     LEVEL     UPPER    MARGINAL

a.b      .         .        +INF       .         
a.c      .        1.000     +INF       .         
a.d      .         .        +INF       .         
b.f      .         .        +INF      2.000      
b.g      .         .        +INF      3.000      
c.d      .         .        +INF      1.000      
c.f      .        1.000     +INF       .         
c.g      .         .        +INF      4.000      
d.g      .         .        +INF      4.000      
d.h      .         .        +INF       .         
f.g      .         .        +INF      2.000      
f.k      .         .        +INF      9.000      
f.n      .        1.000     +INF       .         
g.k      .         .        +INF     12.000      
g.l      .         .        +INF      3.000      
h.l      .         .        +INF      4.000      
h.m      .         .        +INF      9.000      
k.l      .         .        +INF       EPS       
k.n      .         .        +INF       .         
l.n      .         .        +INF       .         
m.n      .         .        +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.lst
