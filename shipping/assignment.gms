GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:30:34 Page 1
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
C o m p i l a t i o n


   1  *shipping.gms
   2   
   3  SETS I 'plant cities' /Atlanta, Boston, Chicago, LosAngeles/,
   4       J 'warehouse cities'/Memphis, Milwaukee, NewYork, Denver, SanFrancisc
      o/;
   5   
   6  PARAMETERS
   7           a(I) 'cars available at plant'
   8                   /Atlanta        5000
   9                    Boston         6000
  10                    Chicago        4000
  11                    LosAngeles     3000/,
  12   
  13           b(J) 'capacity at warehouse'
  14                   /Memphis        6000
  15                    Milwaukee      4000
  16                    NewYork        4000
  17                    Denver         2000
  18                    SanFrancisco   2000/;
  19   
  20  TABLE dist(I,J) 'distance between cities'
  21   
  22                   Memphis         Milwaukee       NewYork         Denver   
             SanFrancisco
  23  Atlanta          371             761             841             1398     
             2496
  24  Boston           1296            1050            206             1949     
             0
  25  Chicago          530             87              802             996      
             2142
  26  LosAngeles       1817            2012            0               1059     
             379
  27   
  28  VARIABLES x(I,J), z;
  29   
  30  POSITIVE VARIABLE x;
  31   
  32  EQUATIONS
  33  cost,
  34  plantEq(I),
  35  warehouseEq(J);
  36   
  37  cost.. sum((I,J), sqrt(dist(I,J))*x(I,J)) =e= z;
  38  plantEq(I).. sum(J, x(I,J)) =e= a(I);
  39  warehouseEq(J).. sum(I, x(I,J)) =e= b(J);
  40   
  41  MODEL shipping /ALL/;
  42  OPTIONS LP = cplex;
  46  shipping.optfile = 1;
  47  SOLVE shipping USING LP MINIMIZING z;
  48   
  49   
  50   


COMPILATION TIME     =        0.000 SECONDS      3 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:30:34 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Equation Listing    SOLVE shipping Using LP From line 47


---- cost  =E=  

cost..  19.2613602842582*x(Atlanta,Memphis)
     
      + 27.5862284482674*x(Atlanta,Milwaukee) + 29*x(Atlanta,NewYork)
     
      + 37.3898381916798*x(Atlanta,Denver)
     
      + 49.9599839871872*x(Atlanta,SanFrancisco) + 36*x(Boston,Memphis)
     
      + 32.4037034920393*x(Boston,Milwaukee)
     
      + 14.3527000944073*x(Boston,NewYork) + 44.1474801092882*x(Boston,Denver)
     
      + 23.0217288664427*x(Chicago,Memphis)
     
      + 9.32737905308882*x(Chicago,Milwaukee)
     
      + 28.3196045170126*x(Chicago,NewYork) + 31.559467676119*x(Chicago,Denver)
     
      + 46.2817458616245*x(Chicago,SanFrancisco)
     
      + 42.6262829718942*x(LosAngeles,Memphis)
     
      + 44.8553229840116*x(LosAngeles,Milwaukee)
     
      + 32.542280190546*x(LosAngeles,Denver)
     
      + 19.4679223339318*x(LosAngeles,SanFrancisco) - z =E= 0 ; (LHS = 0)
     

---- plantEq  =E=  

plantEq(Atlanta)..  x(Atlanta,Memphis) + x(Atlanta,Milwaukee)
     
      + x(Atlanta,NewYork) + x(Atlanta,Denver) + x(Atlanta,SanFrancisco) =E= 
     5000 ; (LHS = 0, INFES = 5000 ****)
     
plantEq(Boston)..  x(Boston,Memphis) + x(Boston,Milwaukee) + x(Boston,NewYork)
     
      + x(Boston,Denver) + x(Boston,SanFrancisco) =E= 6000 ;
     
      (LHS = 0, INFES = 6000 ****)
     
plantEq(Chicago)..  x(Chicago,Memphis) + x(Chicago,Milwaukee)
     
      + x(Chicago,NewYork) + x(Chicago,Denver) + x(Chicago,SanFrancisco) =E= 
     4000 ; (LHS = 0, INFES = 4000 ****)
     
REMAINING ENTRY SKIPPED


---- warehouseEq  =E=  

warehouseEq(Memphis)..  x(Atlanta,Memphis) + x(Boston,Memphis)
     
      + x(Chicago,Memphis) + x(LosAngeles,Memphis) =E= 6000 ;
     
      (LHS = 0, INFES = 6000 ****)
     
warehouseEq(Milwaukee)..  x(Atlanta,Milwaukee) + x(Boston,Milwaukee)
     
      + x(Chicago,Milwaukee) + x(LosAngeles,Milwaukee) =E= 4000 ;
     
      (LHS = 0, INFES = 4000 ****)
     
warehouseEq(NewYork)..  x(Atlanta,NewYork) + x(Boston,NewYork)
     
      + x(Chicago,NewYork) + x(LosAngeles,NewYork) =E= 4000 ;
     
      (LHS = 0, INFES = 4000 ****)
     
REMAINING 2 ENTRIES SKIPPED

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:30:34 Page 3
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Column Listing      SOLVE shipping Using LP From line 47


---- x  

x(Atlanta,Memphis)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       19.2614  cost
        1       plantEq(Atlanta)
        1       warehouseEq(Memphis)

x(Atlanta,Milwaukee)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       27.5862  cost
        1       plantEq(Atlanta)
        1       warehouseEq(Milwaukee)

x(Atlanta,NewYork)
                (.LO, .L, .UP, .M = 0, 0, +INF, 0)
       29       cost
        1       plantEq(Atlanta)
        1       warehouseEq(NewYork)

REMAINING 17 ENTRIES SKIPPED

---- z  

z
                (.LO, .L, .UP, .M = -INF, 0, +INF, 0)
       -1       cost

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:30:34 Page 4
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Model Statistics    SOLVE shipping Using LP From line 47


MODEL STATISTICS

BLOCKS OF EQUATIONS           3     SINGLE EQUATIONS           10
BLOCKS OF VARIABLES           2     SINGLE VARIABLES           21
NON ZERO ELEMENTS            59


GENERATION TIME      =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI


EXECUTION TIME       =        0.031 SECONDS      4 MB  24.8.5 r61358 WEX-WEI
GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/21/18 19:30:34 Page 5
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Solution Report     SOLVE shipping Using LP From line 47


               S O L V E      S U M M A R Y

     MODEL   shipping            OBJECTIVE  z
     TYPE    LP                  DIRECTION  MINIMIZE
     SOLVER  CPLEX               FROM LINE  47

**** SOLVER STATUS     1 Normal Completion         
**** MODEL STATUS      1 Optimal                   
**** OBJECTIVE VALUE           272263.9779

 RESOURCE USAGE, LIMIT          0.031      1000.000
 ITERATION COUNT, LIMIT         0    2000000000

IBM ILOG CPLEX   24.8.5 r61358 Released May 10, 2017 WEI x86 64bit/MS Windows 
Cplex 12.7.1.0

Reading parameter(s) from "C:\Users\shilpak\Documents\gamsdir\projdir\cplex.opt"
>>           lpmethod 3
Finished reading from "C:\Users\shilpak\Documents\gamsdir\projdir\cplex.opt"
Space for names approximately 0.00 Mb
Use option 'names no' to turn use of names off
LP status(1): optimal
Cplex Time: 0.03sec (det. 0.02 ticks)
Optimal solution found.
Objective :      272263.977947


                       LOWER     LEVEL     UPPER    MARGINAL

---- EQU cost            .         .         .       -1.000      

---- EQU plantEq  

              LOWER     LEVEL     UPPER    MARGINAL

Atlanta     5000.000  5000.000  5000.000      .         
Boston      6000.000  6000.000  6000.000    16.739      
Chicago     4000.000  4000.000  4000.000     3.760      
LosAngeles  3000.000  3000.000  3000.000     2.386      

---- EQU warehouseEq  

                LOWER     LEVEL     UPPER    MARGINAL

Memphis       6000.000  6000.000  6000.000    19.261      
Milwaukee     4000.000  4000.000  4000.000     5.567      
NewYork       4000.000  4000.000  4000.000    -2.386      
Denver        2000.000  2000.000  2000.000    27.409      
SanFrancisco  2000.000  2000.000  2000.000   -16.739      

---- VAR x  

                           LOWER     LEVEL     UPPER    MARGINAL

Atlanta   .Memphis           .     5000.000     +INF       .         
Atlanta   .Milwaukee         .         .        +INF     22.019      
Atlanta   .NewYork           .         .        +INF     31.386      
Atlanta   .Denver            .         .        +INF      9.981      
Atlanta   .SanFrancisco      .         .        +INF     66.699      
Boston    .Memphis           .     1000.000     +INF       .         
Boston    .Milwaukee         .         .        +INF     10.098      
Boston    .NewYork           .     1000.000     +INF       .         
Boston    .Denver            .     2000.000     +INF       .         
Boston    .SanFrancisco      .     2000.000     +INF       .         
Chicago   .Memphis           .         .        +INF       .         
Chicago   .Milwaukee         .     4000.000     +INF       .         
Chicago   .NewYork           .         .        +INF     26.945      
Chicago   .Denver            .         .        +INF      0.390      
Chicago   .SanFrancisco      .         .        +INF     59.260      
LosAngeles.Memphis           .         .        +INF     20.979      
LosAngeles.Milwaukee         .         .        +INF     36.902      
LosAngeles.NewYork           .     3000.000     +INF       .         
LosAngeles.Denver            .         .        +INF      2.748      
LosAngeles.SanFrancisco      .         .        +INF     33.821      

                       LOWER     LEVEL     UPPER    MARGINAL

---- VAR z              -INF  2.7226E+5     +INF       .         


**** REPORT SUMMARY :        0     NONOPT
                             0 INFEASIBLE
                             0  UNBOUNDED


EXECUTION TIME       =        0.000 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\Untitled_1.lst
