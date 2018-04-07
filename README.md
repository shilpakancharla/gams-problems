# GAMS

The optimization modeling language is known as the general algebraic modeling system (GAMS). Each GAMS is a collection of GAMS statements. Every sstatement is terminated with a semicolon ";" (experienced user can omit the semicolon when the next statement begins with a keyword). The most basic components in a GAMS model are: 

- Variables
- Equations
- Model and solve statements

## Variables: declaration & type assignment

We need to declare variables of the optimization problem in GAMS. In particular, we need to explicitly declare a variable to denote the quantity to be optimized. The last variable is called the **objective variable**. 

- **Declaration**: To declare a variable in GAMS, start with the keyword **variable** followed by the name for the variable. We can also add some descriptive text after the name. The following statements declare three variables with names `x1`, `x2` and `profit` respectively, where `profit`is the objective variable. The words between the quotation marks are descriptive texts that serve as comments. Experienced users can omit the quote marks around the descriptive texts.

`variable x1 "type 1 picture frames";`

`variable x2 "type 2 picture frames:;`

`variable profit "total profit";`

Alternatively, we can declare multiple variables in a single statement:

`variables`

  `x1 "type 1 picture frames",`
  
  `x2 "type 1 picture frames",`
  
   `profit "total profit";`
   
- **Types of variables**: Every GAMS variable is associated with a type:

  - **free** (default type): a variable that can take any real value 
  
  - **positive**: a variable that can take any nonnegative value (GAMS uses the word "positive" to mean "nonnegative," so a positive variable in GAMS is allowed to be zero)
  
  - **negative**: a variable that an take any nonpositive value (a negative variable in GAMS is allowed to be zero)
  
  - **binary**: a variable that is either 0 or 1
  
  - **integer**: a variable that can only take integer values between specified bounds (the bounds are 0 and 100 by default and can be changed)

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
