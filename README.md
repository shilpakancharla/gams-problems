# GAMS

Rules of an identifier: An identifier such as a `name` starts with a letter and follows by more letters or digits. It has up to 63 characters. The underscore is also allowed to define `names`. 

Examples:

- `Number_Of_Workers`
- `2_Groups`
- `Number-of-supply-points` (this does not count, it has dashes)
- `Black&White` (this does not count because it has a special character)

Sets: A set in GAMS is defined as `set Name "text" / elements/ ;`

We can define multiple sets using sets (or SETS).

Scalars: Scalars can be used to deifne a single data entry. `scalar Name "text" / value /;`

Parameters: Parameters can be used to define a list of oriented data entries. `parameter Name "text" / element [=] value, ... /;`

Tables: Tables can be used to define a multiple dimensional dataset. `Table Table_name "text" element signed_num ...;`
