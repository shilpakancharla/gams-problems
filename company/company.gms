*company.gms

SETS

         I 'warehouse' /w1*w3/,
         J 'customer' /c1*c3/;

PARAMETERS
         supply(I) 'supply of goods in units by warehouse'
                   /w1 30
                    w2 30
                    w3 30/,
         demand(J) 'demand of goods in units by customer'
                   /c1 40
                    c2 50
                    c3 40/,
         penalty(J) 'penalty for unmet demand per unit'
                   /c1 70,
                    c2 75,
                    c3 65/;

TABLE price(I,J) 'costs of shipping 1 unit from each warehouse to each customer'

                c1              c2              c3
w1              15              35              25
w2              10              50              40
w3              20              40              30;

VARIABLE
         x(I,J) 'amount of units transferred from each warehouse to each customer',
         z 'total transportation costs';

Positive Variable x;

EQUATIONS

obj 'minimum transportation cost',
supply 'supply available',

obj.. z =e= sum((I,J), price(I,J)*x(I,J) + 70(40 - x(I,1)) + 75(50 - x(I,2)) + 65(40-x(I,3)));
supply.. sum(I, x(I,J)) =l= 30;

Model company /all/;
Solve company using lp minimizing z;
