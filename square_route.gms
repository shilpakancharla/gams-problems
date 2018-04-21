GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:18:27 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *square_route.gms
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
  43  obj.. totalcost =E= sum(A, sqrt(c(A))*x(A));
  44   
  45  MODEL route /balance, obj/;
  46  SOLVE route USING LP MINIMIZING totalCost;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:18:27 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE route Using LP From line 46


---- balance  =E=  

balance(a)..  x(a,b) + x(a,c) + x(a,d) =E= 1 ; (LHS = 0, INFES = 1 ****)
     
balance(b)..  - x(a,b) + x(b,f) + x(b,g) =E= 0 ; (LHS = 0)
     
balance(c)..  - x(a,c) + x(c,d) + x(c,f) + x(c,g) =E= 0 ; (LHS = 0)
     
REMAINING 8 ENTRIES SKIPPED


---- obj  =E=  

obj..  totalCost - 2.23606797749979*x(a,b) - 1.4142135623731*x(a,c) - 2*x(a,d)
     
      - 1.73205080756888*x(b,f) - 2*x(b,g) - 1.73205080756888*x(c,d) - 2*x(c,f)
     
      - 2.82842712474619*x(c,g) - 2.44948974278318*x(d,g)
     
      - 1.73205080756888*x(d,h) - 1.4142135623731*x(f,g) - 3*x(f,k)
     
      - 3.16227766016838*x(f,n) - 3.46410161513775*x(g,k) - 3*x(g,l) - 3*x(h,l)
     
      - 3.3166247903554*x(h,m) - 2.44948974278318*x(k,l)
     
      - 3.16227766016838*x(k,n) - 2*x(l,n) - 2.64575131106459*x(m,n) =E= 0 ;
     
      (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:18:27 Page 3
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
       -2.2361  obj

x(a,c)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(a)
       -1       balance(c)
       -1.4142  obj

x(a,d)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
        1       balance(a)
       -1       balance(d)
       -2       obj

REMAINING 18 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:18:27 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE route Using LP From line 46


MODEL STATISTICS

BLOCKS OF EQUATIONS           2     SINGLE EQUATIONS           12
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           22
NON ZERO ELEMENTS            64


GENERATION TIME      =        0.094 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.094 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:18:27 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE route Using LP From line 46


               S O L V E      S U M M A R Y

     MODEL   route               OBJECTIVE  totalCost
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  46

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE                6.5765

 RESOURCE USAGE, LIMIT          0.016      1000.000
 ITERATION COUNT, LIMIT         3    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.02sec (det. 0.02 ticks)
Optimal solution found.
Objective :           6.576491


---- EQU balance  

     LOWER     LEVEL     UPPER    MARGINAL

a     1.000     1.000     1.000     3.414      
b      .         .         .        1.178      
c      .         .         .        2.000      
d      .         .         .        1.414      
f      .         .         .         EPS       
g      .         .         .         .         
h      .         .         .       -0.318      
k      .         .         .         .         
l      .         .         .       -1.162      
m      .         .         .       -0.517      
n    -1.000    -1.000    -1.000    -3.162      

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .        1.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR totalCost      -INF      6.576     +INF       .         

---- VAR x  

       LOWER     LEVEL     UPPER    MARGINAL

a.b      .         .        +INF       .         
a.c      .        1.000     +INF       .         
a.d      .         .        +INF       .         
b.f      .         .        +INF      0.554      
b.g      .         .        +INF      0.822      
c.d      .         .        +INF      1.146      
c.f      .        1.000     +INF       .         
c.g      .         .        +INF      0.828      
d.g      .         .        +INF      1.035      
d.h      .         .        +INF       .         
f.g      .         .        +INF      1.414      
f.k      .         .        +INF      3.000      
f.n      .        1.000     +INF       .         
g.k      .         .        +INF      3.464      
g.l      .         .        +INF      1.838      
h.l      .         .        +INF      2.156      
h.m      .         .        +INF      3.118      
k.l      .         .        +INF      1.287      
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

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_4.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_4.lst
