# `Lab-5b`: Recursive Parser of Chemical Formulas
In computer science, a [recursive descent parser](https://en.wikipedia.org/wiki/Recursive_descent_parser) is a kind of top-down parser that recursively walks down a collection of objects until all the objects in the collection have been processed.

### Objectives
The objectives of `lab-5b` are to familiarize students with loading and parsing comma-separated value (CSV) files and developing a recursive descent parser to process the fields of the data records in the `CSV` file. 

In particular, we'll load and process chemical reaction strings of the form: `R00267,C6H8O7+C21H29N7O17P3,C5H6O5+CO2+C21H30N7O17P3+H` where:

__Fields__:
* Field 1: The `name` field contains an identifier for the reaction string, e.g., `R00267`
* Field 2: The `reactants` field contains the reaction string, e.g., `C6H8O7+C21H29N7O17P3`
* Field 3: The `products` field contains the reaction string, e.g., `C5H6O5+CO2+C21H30N7O17P3+H`

### Tasks
A coworker, has provided you with a `CSV` file containing chemical reaction strings, and some logic to parse these reactions in the `src/Parser.jl` file. However, while the parser logic is complete (i.e., it runs without errors), it is not well documented, seems overly complicated and the behavior is not well understood by anybody on your team.

Your task is to analyze the parser and explain its behavior to your coworkers. 

1. __Duration 5 min__: Break into groups and familiarize yourself with the lab structure; what do all the files do?
1. __Duration 20 min__: Analyze and discuss the behavior of the `recursivesplit` and `_recursive_descent_parser` functions in `src/Parser.jl` using a simple text inputs such as `Dog+Cat+Mouse+Lizard`. 
    * To see what the parser is doing, you can add `@show` statements to the `recursivesplit` and `_recursive_descent_parser` functions to print out values. Alternatively, you can use the `debugger` to step through the code (see initial demo).
1. __Duration 15 min__: Finish the implementation of the `production_runme.jl` script to process the reaction strings.
    * The `production_runme.jl` script should load the `CSV` file, parse the reaction strings and store the reaction information in a dictionary of `MyKeggReactionModel` objects (already implemented for you).
    * The `production_runme.jl` script should poulate a unique `Array` of chemical compound strings, called `species_formula_array`, and a unique `Array` of reaction names, called `reaction_name_array`.
    * Challenge problem: The `production_runme.jl` script should also generate a $n \times m$ matrix, called `stoichiometry_matrix`, where $n$ is the number of unique chemical compound strings and $m$ is the number of reaction strings. The `stoichiometry_matrix` should contain the stoichiometry coefficients of the chemical compounds in the reaction strings.
1. __Duration 10 min__: Can you feed reaction strings to the parser that will cause it to fail? If so, what are they? (create a copy of the `Reactions.net` file, and put test cases reactions in the new file).
