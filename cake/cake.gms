*cake.gms

SET I 'types of cakes' /cc, bf/, T 'months'/1*3/;

SCALAR

upbdd 'upper bdd for numer of cakes produced each month' /65/;

PARAMETERS

a(I) 'holding cost in dollars'
         /cc 0.5,
          bf 0.4/;

TABLE d(I,T) 'demand of each type in each month'

         1       2       3
cc       40      30      20
bf       20      30      10;

TABLE c(I,T) 'cost in dollars for each type in each month'

         1       2       3
cc       3.25    3.45    3.90
bf       2.75    2.95    3.45;

VARIABLES

cost 'total cost';

positive variables x(I,T) 'number of cakes of type i in month t'
                   b(I,T) 'number of cakes of type i left in inventory at end of month t';

EQUATIONS

obj 'objective function',
upbddDef(T) 'number of cakes produced each month cannot exced the upper bdd',
inventory(I,T) 'relation between inventory from different months';

obj.. cost =e= sum((I,T), c(I,T)*x(I,T) + a(I)*b(I,T));
upbddDef(T).. sum(I, x(I,T)) =l= upbdd;
inventory(I,T).. x(I,T)+b(I,T-1)$(ord(T)>1)-d(I,T) =e= b(I,T);

model cake /all/;
solve cake using lp minimizing cost;
