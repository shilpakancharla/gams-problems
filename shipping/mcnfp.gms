GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 16:27:58 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *shipping.gms
   2   
   3  SETS I 'plant cities' /Atlanta, Boston, Chicago, LosAngeles/,
   4       J 'warehouse cities'/Memphis, Milwaukee, NewYork, Denver, SanFrancisco/;
   5   
   6  TABLE dist(I,J) 'distance between cities'
   7   
   8                   Memphis         Milwaukee       NewYork         Denver    SanFrancisco
   9  Atlanta          371             761             841             1398      2496
  10  Boston           1296            1050            206             1949      0
  11  Chicago          530             87              802             996       2142
  12  LosAngeles       1817            2012            0               1059      379
  13   
  14  VARIABLES x(I,J), z;
  15   
  16  POSITIVE VARIABLE x;
  17   
  18  EQUATIONS
  19  cost,
  20  plantEq(I),
  21  warehouseEq(J);
  22   
  23  cost.. sum((I,J), sqr(dist(I,J))*x(I,J)) =e= z;
  24  plantEq(I).. sum(J, x(I,J)) =e= 1;
  25  warehouseEq(J).. sum(I, x(I,J)) =e= 1;
  26   
  27  MODEL shipping /ALL/;
  28  OPTIONS LP = cplex;
  32  shipping.optfile = 1;
  33  SOLVE shipping USING LP MINIMIZING z;
  34   
  35   
  36   


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 16:27:58 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shipping Using LP From line 33


---- cost  =E=  

cost..  137641*x(Atlanta,Memphis) + 579121*x(Atlanta,Milwaukee)
     
      + 707281*x(Atlanta,NewYork) + 1954404*x(Atlanta,Denver)
     
      + 6230016*x(Atlanta,SanFrancisco) + 1679616*x(Boston,Memphis)
     
      + 1102500*x(Boston,Milwaukee) + 42436*x(Boston,NewYork)
     
      + 3798601*x(Boston,Denver) + 280900*x(Chicago,Memphis)
     
      + 7569*x(Chicago,Milwaukee) + 643204*x(Chicago,NewYork)
     
      + 992016*x(Chicago,Denver) + 4588164*x(Chicago,SanFrancisco)
     
      + 3301489*x(LosAngeles,Memphis) + 4048144*x(LosAngeles,Milwaukee)
     
      + 1121481*x(LosAngeles,Denver) + 143641*x(LosAngeles,SanFrancisco) - z
      =E= 0 ; (LHS = 0)
     

---- plantEq  =E=  

plantEq(Atlanta)..  x(Atlanta,Memphis) + x(Atlanta,Milwaukee)
     
      + x(Atlanta,NewYork) + x(Atlanta,Denver) + x(Atlanta,SanFrancisco) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
plantEq(Boston)..  x(Boston,Memphis) + x(Boston,Milwaukee) + x(Boston,NewYork)
     
      + x(Boston,Denver) + x(Boston,SanFrancisco) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
plantEq(Chicago)..  x(Chicago,Memphis) + x(Chicago,Milwaukee)
     
      + x(Chicago,NewYork) + x(Chicago,Denver) + x(Chicago,SanFrancisco) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
REMAINING ENTRY SKIPPED


---- warehouseEq  =E=  

warehouseEq(Memphis)..  x(Atlanta,Memphis) + x(Boston,Memphis)
     
      + x(Chicago,Memphis) + x(LosAngeles,Memphis) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
warehouseEq(Milwaukee)..  x(Atlanta,Milwaukee) + x(Boston,Milwaukee)
     
      + x(Chicago,Milwaukee) + x(LosAngeles,Milwaukee) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
warehouseEq(NewYork)..  x(Atlanta,NewYork) + x(Boston,NewYork)
     
      + x(Chicago,NewYork) + x(LosAngeles,NewYork) =E= 1 ;
     
      (LHS = 0, INFES = 1 ****)
     
REMAINING 2 ENTRIES SKIPPED

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 16:27:58 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shipping Using LP From line 33


---- x  

x(Atlanta,Memphis)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
   137641       cost
        1       plantEq(Atlanta)
        1       warehouseEq(Memphis)

x(Atlanta,Milwaukee)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
   579121       cost
        1       plantEq(Atlanta)
        1       warehouseEq(Milwaukee)

x(Atlanta,NewYork)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
   707281       cost
        1       plantEq(Atlanta)
        1       warehouseEq(NewYork)

REMAINING 17 ENTRIES SKIPPED

---- z  

z
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
       -1       cost

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 16:27:58 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shipping Using LP From line 33


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           21
NON ZERO ELEMENTS            59


GENERATION TIME      =        0.421 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.421 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 16:27:58 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shipping Using LP From line 33


               S O L V E      S U M M A R Y

     MODEL   shipping            OBJECTIVE  z
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  33

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      4 Infeasible                
**** OBJECTIVE VALUE                1.0000

 RESOURCE USAGE, LIMIT          0.625      1000.000
 ITERATION COUNT, LIMIT         0    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Reading parameter(s) from "C:\Users\shilpak\Documents\gamsdir\projdir\cplex.opt"
>>           lpmethod 3
Finished reading from "C:\Users\shilpak\Documents\gamsdir\projdir\cplex.opt"
Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(3): infeasible
Cplex Time: 0.14sec (det. 0.01 ticks)
Rerunning with presolve turned off and solving with LPMETHOD=0
LP status(3): infeasible
Cplex Time: 0.14sec (det. 0.01 ticks)
Model has been proven infeasible.

                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU cost            .         .         .       -1.000      

---- EQU plantEq  

              LOWER     LEVEL     UPPER    MARGINAL

Atlanta        1.000     1.000     1.000    -1.000      
Boston         1.000     1.000     1.000    -1.000      
Chicago        1.000     1.000     1.000    -1.000      
LosAngeles     1.000     1.000     1.000    -1.000      

---- EQU warehouseEq  

                LOWER     LEVEL     UPPER    MARGINAL

Memphis          1.000     1.000     1.000     1.000      
Milwaukee        1.000      .        1.000     1.000 INFES
NewYork          1.000     1.000     1.000     1.000      
Denver           1.000     1.000     1.000     1.000      
SanFrancisco     1.000     1.000     1.000     1.000      

---- VAR x  

                           LOWER     LEVEL     UPPER    MARGINAL

Atlanta   .Memphis           .        1.000     +INF       .         
Atlanta   .Milwaukee         .         .        +INF       EPS       
Atlanta   .NewYork           .         .        +INF       EPS       
Atlanta   .Denver            .         .        +INF       EPS       
Atlanta   .SanFrancisco      .         .        +INF       EPS       
Boston    .Memphis           .         .        +INF       EPS       
Boston    .Milwaukee         .         .        +INF       EPS       
Boston    .NewYork           .         .        +INF       EPS       
Boston    .Denver            .         .        +INF       EPS       
Boston    .SanFrancisco      .        1.000     +INF       .         
Chicago   .Memphis           .         .        +INF       EPS       
Chicago   .Milwaukee         .         .        +INF       .         
Chicago   .NewYork           .         .        +INF       EPS       
Chicago   .Denver            .        1.000     +INF       .         
Chicago   .SanFrancisco      .         .        +INF       EPS       
LosAngeles.Memphis           .         .        +INF       EPS       
LosAngeles.Milwaukee         .         .        +INF       EPS       
LosAngeles.NewYork           .        1.000     +INF       .         
LosAngeles.Denver            .         .        +INF       EPS       
LosAngeles.SanFrancisco      .         .        +INF       EPS       

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR z              -INF      1.000     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             1 INFEASIBLE (INFES)
                    SUM      1.000
                    MAX      1.000
                    MEAN     1.000
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst

