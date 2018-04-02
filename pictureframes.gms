 * picframe1.gms
   2   
   3  variables
   4  x1 "type 1 picture frames",
   5  x2 "type 2 picture frames",
   6  profit "total profit";
   7   
   8  positive variables x1, x2;
   9   
  10  equations
  11  obj "max total profit",
  12  labor "labor hours",
  13  metal "metal in oz";
  14   
  15  obj.. profit =e= 2.25*x1 + 2.60*x2;
  16   
  17  labor.. 2*x1 + x2 =1= 4000;
****                      $37,409
  18   
  19  metal.. 1*x1 + 2*x2 =1= 5000;
****                        $37,409
  20   
  21  model picframe /all/;
  22  solve picframe using lp maximizing profit;
****                                           $257

GAMS 24.8.5  r61358 Released May 10, 2017 WEX-WEI x86 64bit/MS Windows 04/02/18 13:51:26 Page 2
G e n e r a l   A l g e b r a i c   M o d e l i n g   S y s t e m
Error Messages


 37  '=l=' or '=e=' or '=g=' operator expected
257  Solve statement not checked because of previous errors
409  Unrecognizable item - skip to find a new statement
       looking for a ';' or a key word to get started again

**** 5 ERROR(S)   0 WARNING(S)


COMPILATION TIME     =        0.016 SECONDS      2 MB  24.8.5 r61358 WEX-WEI


USER: GAMS Development Corporation, Washington, DC   G871201/0000CA-ANY
      Free Demo,  202-342-0180,  sales@gams.com,  www.gams.com   DC0000


**** FILE SUMMARY

Input      C:\Users\shilpak\Documents\gamsdir\projdir\pictureframes.gms
Output     C:\Users\shilpak\Documents\gamsdir\projdir\pictureframes.lst

**** USER ERROR(S) ENCOUNTERED

