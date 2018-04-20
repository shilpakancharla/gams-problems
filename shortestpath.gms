*shortestpath.gms

SETS V/s,u,x,v,z,y/,
     A(V,V) /s.(u,x), u.(s,x,z,v), x.(u,z,y), z.(u,v,y), v.y/;
     
ALIAS 
    (V,i), (V,j);
    
PARAMETERS    
    S(V) 'net supplies for nodes' /s 1, y -1/,
    c(V,V) 'unit cost on arcs'
    /s.u  1
     s.x  3
     u.s  1
     u.x  3
     u.z  2
     u.v  4
     x.u  3
     x.z  1
     x.y  2
     z.u  3
     z.v  1
     z.y  3
     v.y  2/;
     
VARIABLES

totalCost, x(V,V);

POSITIVE VARIABLE x;

EQUATIONS

balance(V), obj;

balance(V).. sum(j$A(V,j), x(V,j)) - sum(i$A(i,V), x(i,V)) =e= S(V);
obj.. totalCost =e= sum(A, c(A)*x(A));

MODEL shortestpath /balance, obj/;
SOLVE shortestpath USING LP MINIMIZING totalCost;
