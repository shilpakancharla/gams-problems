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
