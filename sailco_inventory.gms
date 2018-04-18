*sail_inventory.gms

SET 
T 'indices of quarters' /1*4/;

SCALARS
    iniInv 'inventory at the beginning of first quarter' /10/,
    upRegProd 'upper limit of regular-time production' /40/,
    regUnitCost 'regular time unit cost (dollar per boat)' /400/,
    overUnitCost 'overtime unit cost (dollar per boat)' /450/,
    holdCost 'holding cost (dollar per boat)' /20/;
    
PARAMETERS
    d(T) /1 40, 2 60, 3 75, 4 25/;
    
FREE VARIABLES
    x(T), y(T),
    i(T);
    
EQUATIONS
  obj 'min total cost',
  invRel(T) 'relation between inventory from different periods';
  
  obj.. cost =e= sum(T, regUnitCost*x(T) + overUnitCost*y(T) + holdCost*i(T));
  invRel(T).. i(T) =e= i(T-1)$(ord(T) > 1) + iniInv$(ord(T)=1) + x(T) + y(T) - d(T);
  x.up(T) = upRegProd;
  
MODEL sailboat /ALL/;
SOLVE sailboat USING LP MINIMIZING cost;
  
