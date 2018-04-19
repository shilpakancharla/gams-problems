*mcnfp.gms

SETS V 'nodes'/1*4/, A(V,V) 'arcs'/1.2, 1.3, 2.3, 2.4, 3.4, 4.5/;

ALIAS (V,j);

PARAMETERS
         S(V) 'net supplies at nodes'
                 /
