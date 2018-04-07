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
  
  We can declare the variables first and then assigns types to them in a separate statement:
  
  `positive variables x1, x2;`
  
  We can also declare variables and assign their type in one statement. Note that the objective variable *must* be a free variable in a GAMS optimization model.
  
  Rules of an identifier: An identifier such as a `name` starts with a letter and follows by more letters or digits. It has up to 63 characters. The underscore is also allowed to define `names`. 

Examples:

- `Number_Of_Workers`
- `2_Groups`
- `Number-of-supply-points` (this does not count, it has dashes)
- `Black&White` (this does not count because it has a special character)

- **Sets**: A set in GAMS is defined as `set Name "text" / elements/ ;`

- We can define multiple sets using sets (or SETS).

- **Scalars**: Scalars can be used to deifne a single data entry. `scalar Name "text" / value /;`

- **Parameters**: Parameters can be used to define a list of oriented data entries. `parameter Name "text" / element [=] value, ... /;`

- **Tables**: Tables can be used to define a multiple dimensional dataset. `Table Table_name "text" element signed_num ...;`

  
## Equations: declaration and definition

To solve an optimization problem in GAMS, we need to specify the constraints and the objective function by **equations**. The keyword **equation** has a broad meaning in GAMS; it can mean either an equality or an inequality (see example below). A GAMS equation defined with a common name can also stand for a family of equations of the same structure.

A GAMS equation needs to be declared first, and then defined in a separate statement. To declare an equation is to give it a name. To define an equation is to specify the relations between variables in this equation.

- **Declaration**: to declare an equation, start with the keyword **equation** followed by the name for the equation. As with the declaration of variables, we can add some optional descriptive text after the name. Take a look at the following example: 

`equations`

  `obj    "max total profit",`
  
  `labor  "labor hours",`
  
  `metal  "metal in ox:;`
 
- **Define equations**: To define an equation, start with the name of the equation declared in a preceding statement, put two dots `..` after the name, write down the LHS expression and the RHS expression, and put a relational operator between the two expressions. A relational operator can be one of the following three types:

- **=g= Greater than**: LHS must be greater than or equal to RHS

- **=e= Equality**: RHS must equal LHS.

- **=l= Less than**: LHS must be less than or equal to RHS.

Keep in mind that we *must* use one of the above operators in defining GAMS equations instead of the usual symbols in mathematical formulations. Note that it is possible to use upper case letters (=G=, =E=, and =L=) as well. The following three statements define the three equations declared above, with the equation `obj` specifying the objective function, and equations `labor` and `metal` specifying the two constraints.

  `obj.. profit =e= 2.24*x1 + 2.60*x2;`
  
  `labor.. 2*x1 + x2 =l= 4000;`
  
  `metal.. 1*x1 + 2*x2 =l= 5000;`
  
## Model and solve statements

The model statement is used to collect equations into groups and to label them so that they can be solved.

- **Declaration**: To declare a model, start with the keyword **model** followed by the name for the model, followed by a list of equation names enclosed in slashes. For example, the statement below declares a model named `picframes`, which collects the three equations declared before.

  `model picframe /obj,labor,metal/;`
  
In fact, if all previously defined equations are to be included in a model, we can use `/all/` in place of the explicit list. That is 

  `model picframe /all/;`
  
- **Call solver**: Once a model has been declared and assigned equations, we are ready to call the solver. This is done with a solve statement. A "solve statement" starts with the keyword **solve** followed by the anem of the model to be solved, then another keyword using followed by the model type, then the keyword **minimizing** or **maximizing**, and ends with the name of the objective variable. That is

 `solve Model_Name using Model_Type maximizing [minimizing] Objective_variable;`
 
Below is the solve statement in the example:

    `solve picframe using lp maximizing profit;`

where  `picframe` is the anme of the model just declared, "lp" is the model type, and `profit` is the name of the objective variable declared earlier. 

- **Types of Models**: The model type "lp" stands for linear programming. GAMS can be used to solve various types of models, including

  - **lp** (or LP): for linear programming
  - **qcp** (or QCP): for quadratic constraint programming
  - **nlp** (or NLP): for nonlinear programming
  - **mip** (or MIP): for mixed integer programming, etc.
  
In summary, we obtain the following GAMS model, and save it into a `*.gms` file called `picframe1.gms`: 

  `*picframe1.gms: This is a GAMS model for example (1) above.`
  
  `*Variable declaration`
  
  `variables`
      
      `x1 "type 1 picture frames",`
      
      `x2 "type 2 picture frames",`
      
      `profit "total profit";`
      
   `*Assigns type of variables`
   
   `positive variables x1, x2;`
   
   `*Equation declaration`
   
    `equations`
      
      `obj   "max total profit",`
      
      `labor "labor hours",`
      
      `metal "metal in oz";`
    
    `*Equation definition`
    
      `obj..profit =e= 2.25*x1 + 2.60*x2;`
      
      `labor..2*x1 + x2 =l= 4000;`
      
      `metal..1*x1 +2*x2 =l= 5000;`
      
    `*Model and solve statements`
    
    `model picframe /all/;`
    
    `solve picframe using lp maximizing profit;`

## Set declaration

An important aspect of optimization modeling languages is the use of sets to collect indices. This feature allows the model to be succinctly states and easily read, making it convenient to model large-scale problems. To declare a set, start with the keyword **set** or **SET** followed by the name of the set, followed by members (also called elements) of the set between two slashes. The following statement `picframe2.gms` declares a set name `I` that consists of two elements "type-1" and "type-2".

  `set I /type-1, type-2/;`
  
Note that elements of a set are labels but not numbers. To emphasize this, we can put the labels in quotes in the above statement: 

  `set I /'type-1', 'type-2'/;`

We note that we can define multiple sets at the same time. For example,

   `SETS I "variables" /type-1, type-2/, J "constraints" /labor, metal/;`

