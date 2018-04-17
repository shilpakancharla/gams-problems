*company.gms

SETS I/Warehouse1, Warehouse2, Warehouse3/, J/Customer1, Customer2, Customer3/;

PARAMETERS
         supply(I) 'supply of goods in units by warehouse'/Warehouse1 30, Warehouse2 30, Warehouse3 30/,
         demand(J) 'demand of goods in units by customer'/Customer1 40, Customer2 50, Customer3 40/,
         penalty(J) 'penalty for unmet demand per unit'/Customer1 70, Customer2 75, Customer3 65/;

TABLE price(I,J) 'costs of shipping 1 unit from each warehouse to each customer'

                 Customer1       Customer2       Customer3
Warehouse1              15              35              25
Warehouse2              10              50              40
Warehouse3              20              40              30;

VARIABLE
         x(I,J) 'amount of units transferred from each warehouse to each customer',
         z 'total transportation costs';

Positive Variable x;

EQUATIONS

obj 'minimum transportation cost'

obj.. z =e= sum((I,J),
