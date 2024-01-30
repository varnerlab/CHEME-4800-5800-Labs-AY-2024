# `Lab 2b`: Introduction to Functions, Scope and Error Handling
In `Lab-2b,` we will introduce the concept of a `function` in Julia and the concepts of `scope` and `error handling.` 

## Prerequisite 
(Duration 5 min): Break up into teams of 2-3 people and walk through all the files (starting with `Include.jl` in the `root` directory) in the `Lab-2b`. At the end of 5 min, we'll do a class Q&A to make sure everyone understands the purpose of each file.

## Tasks
__Task 1__: Open a new terminal window in `VSCode`, and start the `Julia REPL` from the `root` directory of the `Lab-2b` using the `julia --project=.` command. At the `julia>` prompt, include the `Include.jl` file using the [include function](https://docs.julialang.org/en/v1/base/base/#Base.include): 

```julia
julia> include("Include.jl")
```

_Discussion_: You should see an error message called a `stack trace.` It gives us a lot of information about what happened, where the error occurred, and potentially how to fix it.
* How do we fix this? Enter the package manager by typing `]` at the `julia>` prompt, and then add the required packages (or directly follow the instructions in the `stack trace`).
* Why didn't the `using Statistics` command throw an error?

__Task 2__: Create an instance of a `Normal` distribution with `μ = 0.20` and `σ = 0.40` using the `build(...)` function. Store the instance in a variable called `d`. For more information on the `Normal` distribution, see [here](https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal).
* `Check`: What is the type of `d`? Use the [typeof function](https://docs.julialang.org/en/v1/base/base/#Core.typeof) to check the type of `d`.
* `Error case`: What happens if you try to create an instance of a `Normal` distribution with `μ = 0.20` and `σ = -0.40`? Try it and see what happens.
    * `Error handling`: How could we change the `build(...)` function to avoid this situation? 

__Task 3__: Generate `n = 100` samples from the `Normal` distribution `d` by issuing the command:
    
```julia
julia> x = sample(d)
```

_Discussion_: Let's explore some of the properties of the `x` variable, and the `sample(...)` function:
* What is the type of `x`? Use the [typeof function](https://docs.julialang.org/en/v1/base/base/#Core.typeof) function to check the type of `x.` How big (number of elements) is `x`? Use the [length function](https://docs.julialang.org/en/v1/base/strings/#Base.length-Tuple{AbstractString}) to check its size. 
* How much memory (in bytes) does `x` occupy? Use the [sizeof function](https://docs.julialang.org/en/v1/base/strings/#Base.sizeof-Tuple{AbstractString}) to check its memory footprint. Do you think this makes sense? Let's get a second opinion; use the [varinfo function](https://docs.julialang.org/en/v1/stdlib/InteractiveUtils/#InteractiveUtils.varinfo) to summarize the variables in the current scope.
* Why didn't we have to pass in the value for the number of samples `n` to the `sample(...)` function?
