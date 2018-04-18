SETS I 'plants'/p1*p3/,
     J 'cities'/c1*c4/;
     
PARAMETERS
     S(I)
          /    p1 35
               p2 50
               p3 40     /,
     D(J)
          /    c1 45
               c2 20
               c3 30
               c4 30     /;
               
TABLE c(I,J)

          c1        c2        c3        c4
p1        8         6         10        9
p2        9         12        13        7
p3        14        9         16        5;

VARIABLES x(I,J), z;
POSITIVE VARIABLE x; 

EQUATIONS 

cost, 
supply(I), 
demand(J);

cost.. sum((I,J), c(I,J)*x(I,J)) =e= z;
supply(I).. sum(J, x(I,J)) =l= s(I);
demand(J).. sum(I, x(I,J)) =g= d(J);

MODEL transport /ALL/;
SOLVE transport USING LP MINIMIZATION z;
