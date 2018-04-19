GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 15:40:18 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  SETS I 'plant cities' /Atlanta, Boston, Chicago, LosAngeles/,
   2       J 'warehouse cities' /Memphis, Milwaukee, NewYork, Denver, SanFrancis
      co/;
   3   
   4  PARAMETERS
   5           a(I) 'cars available at plant'
   6                   /Atlanta        5000
   7                    Boston         6000
   8                    Chicago        4000
   9                    LosAngeles     3000/,
  10   
  11           b(J) 'capacity at warehouse'
  12                   /Memphis        6000
  13                    Milwaukee      4000
  14                    NewYork        4000
  15                    Denver         2000
  16                    SanFrancisco   2000/;
  17   
  18  TABLE
  19           dist(I,J) 'distance between cities'
  20   
  21                   Memphis         Milwaukee       NewYork         Denver   
             SanFrancisco
  22  Atlanta          371             761             841             1398     
             2496
  23  Boston           1296            1050            206             1949     
             3095
  24  Chicago          530             87              802             996      
             2142
  25  LosAngeles       1817            2012            2786            1059     
             379;
  26   
  27  VARIABLES z, x(I,J);
  28   
  29  Positive variable x;
  30   
  31  EQUATIONS
  32  cost 'cost in dollars of shipping a car from plants to warehouses',
  33  supply(I),
  34  demand(J);
  35   
  36  cost.. z =e= sum((I,J), sqr(dist(I,J))*x(I,J));
  37  supply(I).. sum(J, x(I,J)) =l= a(I);
  38  demand(J).. sum(I, x(I,J)) =g= b(J);
  39   
  40  MODEL shipping /ALL/;
  41  SOLVE shipping USING NLP MINIMIZING z;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 15:40:18 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shipping Using NLP From line 41


---- cost  =E=  cost in dollars of shipping a car from plants to warehouses

cost..  z - 137641*x(Atlanta,Memphis) - 579121*x(Atlanta,Milwaukee)
     
      - 707281*x(Atlanta,NewYork) - 1954404*x(Atlanta,Denver)
     
      - 6230016*x(Atlanta,SanFrancisco) - 1679616*x(Boston,Memphis)
     
      - 1102500*x(Boston,Milwaukee) - 42436*x(Boston,NewYork)
     
      - 3798601*x(Boston,Denver) - 9579025*x(Boston,SanFrancisco)
     
      - 280900*x(Chicago,Memphis) - 7569*x(Chicago,Milwaukee)
     
      - 643204*x(Chicago,NewYork) - 992016*x(Chicago,Denver)
     
      - 4588164*x(Chicago,SanFrancisco) - 3301489*x(LosAngeles,Memphis)
     
      - 4048144*x(LosAngeles,Milwaukee) - 7761796*x(LosAngeles,NewYork)
     
      - 1121481*x(LosAngeles,Denver) - 143641*x(LosAngeles,SanFrancisco) =E= 0 ;
     
      (LHS = 0)
     

---- supply  =L=  

supply(Atlanta)..  x(Atlanta,Memphis) + x(Atlanta,Milwaukee)
     
      + x(Atlanta,NewYork) + x(Atlanta,Denver) + x(Atlanta,SanFrancisco) =L= 
     5000 ; (LHS = 0)
     
supply(Boston)..  x(Boston,Memphis) + x(Boston,Milwaukee) + x(Boston,NewYork)
     
      + x(Boston,Denver) + x(Boston,SanFrancisco) =L= 6000 ; (LHS = 0)
     
supply(Chicago)..  x(Chicago,Memphis) + x(Chicago,Milwaukee)
     
      + x(Chicago,NewYork) + x(Chicago,Denver) + x(Chicago,SanFrancisco) =L= 
     4000 ; (LHS = 0)
     
REMAINING ENTRY SKIPPED


---- demand  =G=  

demand(Memphis)..  x(Atlanta,Memphis) + x(Boston,Memphis) + x(Chicago,Memphis)
     
      + x(LosAngeles,Memphis) =G= 6000 ; (LHS = 0, INFES = 6000 ****)
     
demand(Milwaukee)..  x(Atlanta,Milwaukee) + x(Boston,Milwaukee)
     
      + x(Chicago,Milwaukee) + x(LosAngeles,Milwaukee) =G= 4000 ;
     
      (LHS = 0, INFES = 4000 ****)
     
demand(NewYork)..  x(Atlanta,NewYork) + x(Boston,NewYork) + x(Chicago,NewYork)
     
      + x(LosAngeles,NewYork) =G= 4000 ; (LHS = 0, INFES = 4000 ****)
     
REMAINING 2 ENTRIES SKIPPED

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 15:40:18 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shipping Using NLP From line 41


---- z  

z
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       cost


---- x  

x(Atlanta,Memphis)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
  -137641       cost
        1       supply(Atlanta)
        1       demand(Memphis)

x(Atlanta,Milwaukee)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
  -579121       cost
        1       supply(Atlanta)
        1       demand(Milwaukee)

x(Atlanta,NewYork)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
  -707281       cost
        1       supply(Atlanta)
        1       demand(NewYork)

REMAINING 17 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 15:40:18 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shipping Using NLP From line 41


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           21
NON ZERO ELEMENTS            61     NON LINEAR N-Z              0
DERIVATIVE POOL              20     CONSTANT POOL              16
CODE LENGTH                   0


GENERATION TIME      =        0.047 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.047 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 15:40:18 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shipping Using NLP From line 41


               S O L V E      S U M M A R Y

     MODEL   shipping            OBJECTIVE  z
     TYPE    NLP                 DIRECTION  MINIMIZE
     SOLVER  CONOPT              FROM LINE  41

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      5 Locally Infeasible        
**** OBJECTIVE VALUE      10000000000.0000

 RESOURCE USAGE, LIMIT          0.250      1000.000
 ITERATION COUNT, LIMIT         4    2000000000
 EVALUATION ERRORS              0             0
CONOPT 3         24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
 
 
    C O N O P T 3   version 3.17C
    Copyright (C)   ARKI Consulting and Development A/S
                    Bagsvaerdvej 246 A
                    DK-2880 Bagsvaerd, Denmark
 
 
                   Pre-triangular equations:   0
                   Post-triangular equations:  1
 
 
 ** Infeasible solution. A free variable exceeds the allowable range.
    Current value is 2.65E+10 and current upper bound (Rtmaxv) is 1.00E+10
 
    The allowable range can be changed with option:
 
    Rtmaxv=x.xxe+xx
 
 
 CONOPT time Total                            0.232 seconds
   of which: Function evaluations             0.002 =  0.9%
             1st Derivative evaluations       0.000 =  0.0%
 

**** ERRORS/WARNINGS IN VARIABLE z
     1 error(s): Free variable becomes too large

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU cost            .    -1.65E+10      .         EPS  INFES

  cost  cost in dollars of shipping a car from plants to warehouses

---- EQU supply  

              LOWER     LEVEL     UPPER    MARGINAL

Atlanta        -INF   5000.000  5000.000      EPS       
Boston         -INF   6000.000  6000.000      EPS       
Chicago        -INF   4000.000  4000.000      EPS       
LosAngeles     -INF   3000.000  3000.000      EPS       

---- EQU demand  

                LOWER     LEVEL     UPPER    MARGINAL

Memphis       6000.000  6000.000     +INF       EPS       
Milwaukee     4000.000  4000.000     +INF       EPS       
NewYork       4000.000  4000.000     +INF       EPS       
Denver        2000.000  2000.000     +INF       EPS       
SanFrancisco  2000.000  2000.000     +INF       EPS       

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR z              -INF  1.000E+10     +INF       EPS  UNBND

---- VAR x  

                           LOWER     LEVEL     UPPER    MARGINAL

Atlanta   .Memphis           .     2000.000     +INF       EPS       
Atlanta   .Milwaukee         .     1000.000     +INF       EPS       
Atlanta   .NewYork           .         .        +INF       EPS       
Atlanta   .Denver            .     2000.000     +INF       EPS       
Atlanta   .SanFrancisco      .         .        +INF       EPS       
Boston    .Memphis           .         .        +INF       EPS       
Boston    .Milwaukee         .     2000.000     +INF       EPS       
Boston    .NewYork           .     4000.000     +INF       EPS       
Boston    .Denver            .         .        +INF       EPS       
Boston    .SanFrancisco      .         .        +INF       EPS       
Chicago   .Memphis           .     1000.000     +INF       EPS       
Chicago   .Milwaukee         .     1000.000     +INF       EPS       
Chicago   .NewYork           .         .        +INF       EPS       
Chicago   .Denver            .         .        +INF       EPS       
Chicago   .SanFrancisco      .     2000.000     +INF       EPS       
LosAngeles.Memphis           .     3000.000     +INF       EPS       
LosAngeles.Milwaukee         .         .        +INF       EPS       
LosAngeles.NewYork           .         .        +INF       EPS       
LosAngeles.Denver            .         .        +INF       EPS       
LosAngeles.SanFrancisco      .         .        +INF       EPS       


**** REPORT SUMMARY :        0     NONOPT
                             1 INFEASIBLE (INFES)
                    SUM  1.651E+10
                    MAX  1.651E+10
                    MEAN 1.651E+10
                             1  UNBOUNDED (UNBND)
                             1     ERRORS ( ****)
                             2  PROJECTED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst
