GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:15:51 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *shortestpath.gms
   2   
   3  SETS V/F1*F10, T1*T11/,
   4       A(V,V) /F1.(T2, T3, T4), F2.(T5, T6), F3.(T4, T5, T6), F4.(T6, T7),
   5               F5.(T6, T8, T11), F6.(T8, T9), F7.(T9, T10), F8.(T9, T11),
   6               F9.(T11), F10.(T11)/;
   7   
   8  ALIAS
   9           (V,i), (V,j);
  10   
  11  PARAMETERS
  12           S(V) 'net supplies for nodes' /F1 1, T11 -1/,
  13           c(V,V) 'unit cost on arcs'
  14                   /F1.T2          5
  15                    F1.T3          2
  16                    F1.T4          4
  17                    F2.T5          3
  18                    F2.T6          4
  19                    F3.T4          3
  20                    F3.T5          4
  21                    F3.T6          8
  22                    F4.T6          6
  23                    F4.T7          3
  24                    F5.T6          2
  25                    F5.T8          9
  26                    F5.T11         10
  27                    F6.T8          12
  28                    F6.T9          9
  29                    F7.T9          9
  30                    F7.T10         11
  31                    F8.T9          6
  32                    F8.T11         10
  33                    F9.T11         4
  34                    F10.T11        7/;
  35   
  36  VARIABLES
  37  totalCost, x(V,V);
  38   
  39  POSITIVE VARIABLE x;
  40   
  41  EQUATIONS
  42   
  43  balance(V), obj;
  44   
  45  balance(V).. sum(j$A(V,j), x(V,j)) = sum(i$A(i,V), x(i,V)) =e= S(V);
  46  obj.. totalCost =e= sum(A, c(A)*x(A));
  47   
  48  MODEL shortestpath /balance, obj/;
  49  SOLVE shortestpath USING DNLP MINIMIZING totalCost;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:15:51 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shortestpath Using DNLP From line 49


**** Exec Error at line 45: Equation infeasible due to rhs value

**** INFEASIBLE EQUATIONS ...

---- balance  =E=  

balance(T1)..  0 =E= -1 ; (LHS = 0, INFES = 1 ****)
     
REMAINING 20 ENTRIES SKIPPED


---- obj  =E=  

obj..  totalCost - 5*x(F1,T2) - 2*x(F1,T3) - 4*x(F1,T4) - 3*x(F2,T5)
     
      - 4*x(F2,T6) - 3*x(F3,T4) - 4*x(F3,T5) - 8*x(F3,T6) - 6*x(F4,T6)
     
      - 3*x(F4,T7) - 2*x(F5,T6) - 9*x(F5,T8) - 10*x(F5,T11) - 12*x(F6,T8)
     
      - 9*x(F6,T9) - 9*x(F7,T9) - 11*x(F7,T10) - 6*x(F8,T9) - 10*x(F8,T11)
     
      - 4*x(F9,T11) - 7*x(F10,T11) =E= 0 ; (LHS = 0)
     
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:15:51 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shortestpath Using DNLP From line 49


---- totalCost  

totalCost
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       obj


---- x  

x(F1,T2)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(F1)
       (0)      balance(T2)
       -5       obj

x(F1,T3)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(F1)
       (0)      balance(T3)
       -2       obj

x(F1,T4)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       (0)      balance(F1)
       (0)      balance(T4)
       -4       obj

REMAINING 18 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 18:15:51 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shortestpath Using DNLP From line 49


MODEL STATISTICS

BLOCKS OF EQUATIONS           2     SINGLE EQUATIONS           22
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           22
NON ZERO ELEMENTS            64     NON LINEAR N-Z              0
DERIVATIVE POOL              20     CONSTANT POOL              16
CODE LENGTH                 122


GENERATION TIME      =        0.000 SECONDS      4 MB  24.8.5 r61358 WEX-WEI

**** SOLVE from line 49 ABORTED, EXECERROR = 1


EXECUTION TIME       =        0.000 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_2.lst

**** USER ERROR(S) ENCOUNTERED
