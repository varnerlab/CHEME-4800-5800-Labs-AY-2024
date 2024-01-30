# `Lab 2b`: Introduction to Functions, Scope and Error Handling
In this `Lab`, we will introduce the concept of a `function` in `Julia`, as well as the concepts such as `scope` and `error handling`. 

## Prerequsite 
(Duration 5 min): Break up in teams of 2-3 people, and walk through all the files (starting witn `Include.jl` in the `root` directory) in the `Lab-2b`. 
* At the end of 5-min: we'll do a class Q&A to make sure everyone understands the purpose of each file.

## Tasks
__Task 1__: Open a new terminal window in `VSCode`, and start the `Julia REPL` from the `root` directory of the `Lab-2b` using the `julia --project=.` command. At the `Julia` prompt, include the `Include.jl` file using the `include(...)` function: 

```julia
julia> include("Include.jl")
```

__Discussion__: You should see an error message called a `stack trace`. It gives us a lot of information about what happened, where the error occurred, and potentially how to fix it.
* How do we fix this? Enter the package manager by typing `]` at the `Julia` prompt, and then add the required packages (or directly follow the instructions in the `stack trace`).

__Task 2__: Create an instance of a `Normal` distributuon with `μ = 0.20` and `σ = 0.40` using the `build(...)` function. Store the instance in a variable called `d`. For more information on the `Normal` distribution, see [here](https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal).
* `Check`: What is the type of `d`? Use the `typeof(...)` function to check the type of `d`.
* `Error case`: What happens if you try to create an instance of a `Normal` distribution with `μ = 0.20` and `σ = -0.40`? Try it and see what happens.

__Task 3__: Generate `n = 100` samples from the `Normal` distribution `d` by issuusinf the command:
    
```julia
julia> x = sample(d)
```

__Discussion__: Let's explore some of the propertoes of the `x` variable, and the `sample(...)` function:
* What is the type of `x`? Use the `typeof(...)` function to check the type of `x`. 
* How big (number of elements) is `x`? Use the `length(...)` function to check the size of `x`. 
* How much memory (in bytes) does `x` occupy? Use the `sizeof(...)` function to check the memory footprint of `x`. Does this make sense? Let's get a second opinion, use the `varinfo()` function to get a summary of the variables in the current scope.
* Why didn't we have to pass in the value for the number of samples `n` to the `sample(...)` function?