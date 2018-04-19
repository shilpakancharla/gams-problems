SETS I 'plant cities' /Atlanta, Boston, Chicago, LosAngeles/,
     J 'warehouse cities' /Memphis, Milwaukee, NewYork, Denver, SanFrancisco/;

PARAMETERS
         a(I) 'cars available at plant'
                 /Atlanta        5000
                  Boston         6000
                  Chicago        4000
                  LosAngeles     3000/,

         b(J) 'capacity at warehouse'
                 /Memphis        6000
                  Milwaukee      4000
                  NewYork        4000
                  Denver         2000
                  SanFrancisco   2000/;

TABLE
         dist(I,J) 'distance between cities'

                 Memphis         Milwaukee       NewYork         Denver          SanFrancisco
Altanta          371             761             841             1398            2496
Boston           1296            1050            206             1949            3095
Chicago          530             87              802             996             2142
LosAngeles       1817            2012            2786            1059            379;

VARIABLES z, x(I,J);

Positive variable x;

EQUATIONS
cost 'cost in dollars of shipping a car from plants to warehouses',
supply(I),
demand(J);

cost.. z =e= sum((I,J), dist(I,J)*x(I,J));
supply(I).. sum(J, x(I,J)) =l= a(I);
demand(J).. sum(I, x(I,J) =g= b(J);

MODEL shipping /ALL/;
SOLVE shipping USING LP MINIMIZING z;
