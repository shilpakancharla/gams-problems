*assignment.gms

SETS I 'jobs' /job1*job4/,
     J 'machines' /m1*m4/;
     
TABLES
      c(I,J)
              m1    m2    m3    m4
      job1    14     2     7     2   
      job2     5    12     8     4
      job3     8     6     3     6
      job4     7     5     9    10;
      
VARIABLES
x(I,J), z;

POSITIVE VARIABLE x;

EQUATIONS

cost, jobEq(I), machine(J);

cost..  sum((I,J), c(I,J)*x(I,J)) =e= z;
jobEq(I)..  sum(J, x(I,J)) =e= 1;
machine(J)..  sum(I, x(I,J)) =e= 1;

MODEL assignment /ALL/;
OPTIONS LP = cplex;
$onecho > cplex.opt
  lpmethod 3
$offecho
assignment.optfile = 1;
SOLVE assignment USING LP MINIMIZING z;
