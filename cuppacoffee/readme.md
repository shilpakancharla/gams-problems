Cuppa Coffee Company mixes specialty coffee blends to sell to SmartBux, a small
chain of coffee shops. The ingredients for their specialty coffee are the following beans:

| Bean Type | Cost Per Pound | Available amount (pounds) |
| :---         |     :---:      |          ---: |
| Columbian   | $1.00     | 550    |
| Brazilian     | $0.85       | 450      |
| Sumatran     | $1.55       | 650      |

Cuppa’s products are:

• Robust Joe must consist of 60%–75% Sumatran beans and at least 10% Columbian beans. Each pound
of Robust Joe can be sold to SmartBux for $4.25.

• Light Joe must consist of 50%–60% Brazilian beans and no more than 20% Sumatran beans. Each
pound of Light Joe can be sold to SmartBux for $3.95.

Formulate an LP to maximize total profit. To check the correctness of your solution: the maximum profit is
$4902.5.

Create a GAMS file named `cuppacoffee.gms`. In the GAMS code, declare the following two sets,

`SETS I /Columbian, Brazilian, Sumatran/, J /Robust, Light/;`

and then declare a variable `x` over `(I,J)`. Declare the bean supply, purchase prices and coffee prices as
parameters over `I` or `J`. For simplicity, you can use numbers for percentages in the equations (without
declaring them as scalars). Example:

`equations RS1 "Robust has at least 60 percent of sumatran";`

`RS1.. x("Sumatran","Robust") =g= 0.6* sum(I, x(I,"Robust"));`


Similar Blending Problem: https://www.gams.com/products/simple-example/
