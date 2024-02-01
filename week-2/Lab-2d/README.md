# `Lab 2d`: Introduction to Structs, Conditional Evaluation and Testing
The objective of `lab-2d` is to give you practice with [Structs](https://docs.julialang.org/en/v1/base/base/#struct), [functions](https://docs.julialang.org/en/v1/base/base/#function) and [conditional evaluation statements, e.g., if-else statements](https://docs.julialang.org/en/v1/manual/control-flow/#man-conditional-evaluation) in [Julia](https://docs.julialang.org/en/v1/). 

* This will be the first lab where you will use a collection of `tests` to verify the correctness of your code. We'll use the `@assert macro` and the [Test module](https://docs.julialang.org/en/v1/stdlib/Test/) to write a test plan and then test your code.

## Prerequisite 
Break up into teams of 2-3 people and take `5 min` to walk through all the files (starting with `Include.jl` in the `root` directory) in `Lab-2d`. At the end of `5 min`, we'll do a class Q&A to ensure everyone understands the purpose of each file.

## Tasks

### Development
In `lab-2d`, you will create a collection of `MyStudentModels` instances and write a `find` function to locate the index of a particular student in our collection of students.

1. Implement the `MyStudentModel` struct in the `Types.jl` file. `MyStudentModel` has two fields: a student id field (`sid::Int64`) and a netid field (`netid::String`). 
1. Implement the `build(model::Type{MyStudentModel}; sid::Int64 = 0, netid::String="abc123")::MyStudentModel` function in `Factory.jl`
1. Build an `Array{MyStudentModel,1}` holding random students using the `build` function.
1. Complete the implementation of the `find` function in `Compute.jl` that returns the index of the student object by matching the `sid` and `netid` fields

In all cases, make sure to complete `docstrings` for each function and struct. For more information on the `docstring` syntax, see [here](https://docs.julialang.org/en/v1/manual/documentation/#Writing-Documentation).

### Testing
In `lab-2d`, we have included example tests which are designed to verify the correctness of your codde. 
* The `testme_assert.jl` file is an `old school` sort of test plan that uses the `@assert macro` function to verify the correctness of your code. More details about the `@assert` macro can be found [here](https://docs.julialang.org/en/v1/base/base/#Base.@assert).
* The `testme_testset.jl` file is a more modern test plan that uses the `@testset` macro in combination with the [Test package](https://docs.julialang.org/en/v1/stdlib/Test/#Unit-Testing) to verify the correctness of your code. More details about the `@testset` macro can be found [here](https://docs.julialang.org/en/v1/stdlib/Test/#Test.@testset).

Let's run these test together to verify the correctness of your code.