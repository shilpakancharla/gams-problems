GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 14:53:03 Page 1
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
  36  cost.. z =e= sum((I,J), dist(I,J)*x(I,J));
  37  supply(I).. sum(J, x(I,J)) =l= a(I);
  38  demand(J).. sum(I, x(I,J)) =g= b(J);
  39   
  40  MODEL shipping /ALL/;
  41  SOLVE shipping USING LP MINIMIZING z;


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 14:53:03 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shipping Using LP From line 41


---- cost  =E=  cost in dollars of shipping a car from plants to warehouses

cost..  z - 371*x(Atlanta,Memphis) - 761*x(Atlanta,Milwaukee)
     
      - 841*x(Atlanta,NewYork) - 1398*x(Atlanta,Denver)
     
      - 2496*x(Atlanta,SanFrancisco) - 1296*x(Boston,Memphis)
     
      - 1050*x(Boston,Milwaukee) - 206*x(Boston,NewYork) - 1949*x(Boston,Denver)
     
      - 3095*x(Boston,SanFrancisco) - 530*x(Chicago,Memphis)
     
      - 87*x(Chicago,Milwaukee) - 802*x(Chicago,NewYork) - 996*x(Chicago,Denver)
     
      - 2142*x(Chicago,SanFrancisco) - 1817*x(LosAngeles,Memphis)
     
      - 2012*x(LosAngeles,Milwaukee) - 2786*x(LosAngeles,NewYork)
     
      - 1059*x(LosAngeles,Denver) - 379*x(LosAngeles,SanFrancisco) =E= 0 ;
     
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

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 14:53:03 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shipping Using LP From line 41


---- z  

z
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
        1       cost


---- x  

x(Atlanta,Memphis)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
     -371       cost
        1       supply(Atlanta)
        1       demand(Memphis)

x(Atlanta,Milwaukee)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
     -761       cost
        1       supply(Atlanta)
        1       demand(Milwaukee)

x(Atlanta,NewYork)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
     -841       cost
        1       supply(Atlanta)
        1       demand(NewYork)

REMAINING 17 ENTRIES SKIPPED
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 14:53:03 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shipping Using LP From line 41


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           21
NON ZERO ELEMENTS            61


GENERATION TIME      =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/19/18 14:53:03 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shipping Using LP From line 41


               S O L V E      S U M M A R Y

     MODEL   shipping            OBJECTIVE  z
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  41

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE          8089000.0000

 RESOURCE USAGE, LIMIT          0.015      1000.000
 ITERATION COUNT, LIMIT         9    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.00sec (det. 0.02 ticks)
Optimal solution found.
Objective :     8089000.000000


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU cost            .         .         .        1.000      

  cost  cost in dollars of shipping a car from plants to warehouses

---- EQU supply  

              LOWER     LEVEL     UPPER    MARGINAL

Atlanta        -INF   5000.000  5000.000  -925.000      
Boston         -INF   6000.000  6000.000      .         
Chicago        -INF   4000.000  4000.000  -953.000      
LosAngeles     -INF   3000.000  3000.000  -890.000      

---- EQU demand  

                LOWER     LEVEL     UPPER    MARGINAL

Memphis       6000.000  6000.000     +INF   1296.000      
Milwaukee     4000.000  4000.000     +INF   1040.000      
NewYork       4000.000  4000.000     +INF    206.000      
Denver        2000.000  2000.000     +INF   1949.000      
SanFrancisco  2000.000  2000.000     +INF   1269.000      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR z              -INF  8.0890E+6     +INF       .         

---- VAR x  

                           LOWER     LEVEL     UPPER    MARGINAL

Atlanta   .Memphis           .     5000.000     +INF       .         
Atlanta   .Milwaukee         .         .        +INF    646.000      
Atlanta   .NewYork           .         .        +INF   1560.000      
Atlanta   .Denver            .         .        +INF    374.000      
Atlanta   .SanFrancisco      .         .        +INF   2152.000      
Boston    .Memphis           .     1000.000     +INF       .         
Boston    .Milwaukee         .         .        +INF     10.000      
Boston    .NewYork           .     4000.000     +INF       .         
Boston    .Denver            .     1000.000     +INF       .         
Boston    .SanFrancisco      .         .        +INF   1826.000      
Chicago   .Memphis           .         .        +INF    187.000      
Chicago   .Milwaukee         .     4000.000     +INF       .         
Chicago   .NewYork           .         .        +INF   1549.000      
Chicago   .Denver            .         .        +INF       .         
Chicago   .SanFrancisco      .         .        +INF   1826.000      
LosAngeles.Memphis           .         .        +INF   1411.000      
LosAngeles.Milwaukee         .         .        +INF   1862.000      
LosAngeles.NewYork           .         .        +INF   3470.000      
LosAngeles.Denver            .     1000.000     +INF       .         
LosAngeles.SanFrancisco      .     2000.000     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst
