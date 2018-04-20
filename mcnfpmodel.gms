*mcnfp.gms

SETS V 'nodes' /1*4/,
     A(V,V) 'arcs' /1.2, 1.3, 2.3, 3.2, 2.4, 3.4/;
     
ALIAS
      (V, j);
      
PARAMETERS
      S(V) 'net supplies at nodes'
        /1 10, 2 30, 3 10, 4 -50/
      c(V,V) 'unit cost on arcs' 
        /1.2  5
         1.3  1
         2.3  1
         3.2  2
         2.4  10
         3.4 8/,
      u(V,V) 'upper bounds'
        /1.2  30
         1.3  100
         2.3  100
         3.2  10
         2.4  100
         3.4  20/;
         
VARIABLES
  totalCost, x(V,V);
  
POSITIVE VARIABLE x;

EQUATIONS

balance(V), obj;

balance(V).. sum(j$A(V,j), x(V,j)) - sum(j$A(j,V)) =e= S(V);
obj.. totalCost =e= sum(A, c(A)*x(A));
x.up(A) = u(A)

MODEL mcnfp /ALL/;
SOLVE mcnfp USING LP MINIMIZING totalCost;
