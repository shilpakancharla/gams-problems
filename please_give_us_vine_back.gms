GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:40:35 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *shortestpath.gms
   2   
   3  SETS V/1,2,3,4,5,6,7,8,9,10,11/,
   4       A(V,V) /1.(2,3,4), 2.(5,6), 3.(4,5,6), 4.(6,7), 5.(6,8,11), 6.(8,9),
   5              7.(9,10), 8.(9,11), 9.11, 10.11/;
   6   
   7  ALIAS
   8           (V,i), (V,j);
   9   
  10  PARAMETERS
  11           S(V) 'net supplies for nodes' /1 1, 11 -1/,
  12           c(V,V) 'unit cost on arcs'
  13                   /1.2          5
  14                    1.3          2
  15                    1.4          4
  16                    2.5          3
  17                    2.6          4
  18                    3.4          3
  19                    3.5          4
  20                    3.6          8
  21                    4.6          6
  22                    4.7          3
  23                    5.6          2
  24                    5.8          9
  25                    5.11         10
  26                    6.8          12
  27                    6.9          9
  28                    7.9          9
  29                    7.10         11
  30                    8.9          6
  31                    8.11         10
  32                    9.11         4
  33                    10.11        7/;
  34   
  35  VARIABLES
  36  totalCost, x(V,V);
  37   
  38  POSITIVE VARIABLE x;
  39   
  40  EQUATIONS
  41   
  42  balance(V), obj;
  43   
  44  balance(V).. sum(j$A(V,j), x(V,j)) = sum(i$A(i,V), x(i,V)) =e= S(V);
  45  obj.. totalCost =e= sum(A, c(A)*x(A));
  46   
  47  MODEL shortestpath /balance, obj/;
  48  SOLVE shortestpath USING DNLP MINIMIZING totalCost;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:40:35 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shortestpath Using DNLP From line 48


---- balance  =E=  

balance(1)..  (0)*x(1,2) + (0)*x(1,3) + (0)*x(1,4) =E= 1 ; (LHS = 1)
     
balance(2)..  (0)*x(1,2) + (0)*x(2,5) + (0)*x(2,6) =E= 0 ;
     
      (LHS = 1, INFES = 1 ****)
     
balance(3)..  (0)*x(1,3) + (0)*x(3,4) + (0)*x(3,5) + (0)*x(3,6) =E= 0 ;
     
      (LHS = 1, INFES = 1 ****)
     
REMAINING 8 ENTRIES SKIPPED


---- obj  =E=  

obj..  totalCost - 5*x(1,2) - 2*x(1,3) - 4*x(1,4) - 3*x(2,5) - 4*x(2,6)
     
      - 3*x(3,4) - 4*x(3,5) - 8*x(3,6) - 6*x(4,6) - 3*x(4,7) - 2*x(5,6)
     
      - 9*x(5,8) - 10*x(5,11) - 12*x(6,8) - 9*x(6,9) - 9*x(7,9) - 11*x(7,10)
     
      - 6*x(8,9) - 10*x(8,11) - 4*x(9,11) - 7*x(10,11) =E= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:40:35 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shortestpath Using DNLP From line 48


---- totalCost  

totalCost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(1,2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(1)
       (0)      balance(2)
       -5       obj

x(1,3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(1)
       (0)      balance(3)
       -2       obj

x(1,4)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(1)
       (0)      balance(4)
       -4       obj

REMAINING 18 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:40:35 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shortestpath Using DNLP From line 48


MODEL STATISTICS

BLOCKS OF EQUATIONS           2     SINGLE EQUATIONS           12
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           22
NON ZERO ELEMENTS            64     NON LINEAR N-Z             42
DERIVATIVE POOL              20     CONSTANT POOL              16
CODE LENGTH                  77


GENERATION TIME      =        0.016 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.016 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:40:35 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shortestpath Using DNLP From line 48


               S O L V E      S U M M A R Y

     MODEL   shortestpath        OBJECTIVE  totalCost
     TYPE    DNLP                DIRECTION  MINIMIZE
     SOLVER  CONOPT              FROM LINE  48

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      5 Locally Infeasible        
**** OBJECTIVE VALUE                0.0000

 RESOURCE USAGE, LIMIT          0.296      1000.000
 ITERATION COUNT, LIMIT         3    2000000000
 EVALUATION ERRORS              0             0
CONOPT 3         24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
 
 
    C O N O P T 3   version 3.17C
    Copyright (C)   ARKI Consulting and Development A/S
                    Bagsvaerdvej 246 A
                    DK-2880 Bagsvaerd, Denmark
 
 
    The model has 22 variables and 12 constraints
    with 64 Jacobian elements, 42 of which are nonlinear.
    The Hessian of the Lagrangian has 21 elements on the diagonal,
    65 elements below the diagonal, and 21 nonlinear variables.
 
 ** Warning **  The number of nonlinear derivatives equal to zero
                in the initial point is large (= 65 percent).
                A better initial point will probably help the
                optimization.
 
 
                   Pre-triangular equations:   0
                   Post-triangular equations:  1
 
 
 ** Infeasible solution. There are no superbasic variables.
 
 
 ** Warning **  The number of nonlinear derivatives equal to zero
                in the final point is large (= 55 percent).
                Better bounds on the variables may help the
                optimization.
 
 
 CONOPT time Total                            0.247 seconds
   of which: Function evaluations             0.005 =  2.0%
             1st Derivative evaluations       0.027 = 10.9%
 

---- EQU balance  

      LOWER     LEVEL     UPPER    MARGINAL

1      1.000     1.000     1.000      .         
2       .        1.000      .       -1.000 INFES
3       .        1.000      .       -1.000 INFES
4       .        1.000      .       -1.000 INFES
5       .        1.000      .       -1.000 INFES
6       .        1.000      .       -1.000 INFES
7       .        1.000      .       -1.000 INFES
8       .        1.000      .       -1.000 INFES
9       .        1.000      .       -1.000 INFES
10      .        1.000      .       -1.000 INFES
11    -1.000     1.000    -1.000    -1.000 INFES

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU obj             .         .         .         EPS       

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR totalCost      -INF       .        +INF       .         

---- VAR x  

         LOWER     LEVEL     UPPER    MARGINAL

1 .2       .         .        +INF       EPS       
1 .3       .         .        +INF       EPS       
1 .4       .         .        +INF       EPS       
2 .5       .         .        +INF       EPS       
2 .6       .         .        +INF       EPS       
3 .4       .         .        +INF       EPS       
3 .5       .         .        +INF       EPS       
3 .6       .         .        +INF       EPS       
4 .6       .         .        +INF       EPS       
4 .7       .         .        +INF       EPS       
5 .6       .         .        +INF       EPS       
5 .8       .         .        +INF       EPS       
5 .11      .         .        +INF       EPS       
6 .8       .         .        +INF       EPS       
6 .9       .         .        +INF       EPS       
7 .9       .         .        +INF       EPS       
7 .10      .         .        +INF       EPS       
8 .9       .         .        +INF       EPS       
8 .11      .         .        +INF       EPS       
9 .11      .         .        +INF       EPS       
10.11      .         .        +INF       EPS       


**** REPORT SUMMARY :        0     NONOPT
                            10 INFEASIBLE (INFES)
                    SUM     11.000
                    MAX      2.000
                    MEAN     1.100
                             0  UNBOUNDED
                             0     ERRORS


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.lst
