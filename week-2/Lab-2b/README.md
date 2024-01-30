# `Lab 2b`: Introduction to Functions, Scope and Error Handling
In `Lab-2b`, we will introduce the concept of a `function` in Julia, see how our codes will be organized, and discuss concepts such as `scope` and `error handling.` 

## Prerequisite 
Break up into teams of 2-3 people and take `5 min` to walk through all the files (starting with `Include.jl` in the `root` directory) in the `Lab-2b`. At the end of `5 min`, we'll do a class Q&A to ensure everyone understands each file's purpose.

## Tasks
__Task 1__: Open a new terminal window in `VSCode`, and start the `Julia REPL` from the `root` directory of the `Lab-2b` using the `julia --project=.` command. At the `julia>` prompt, include the `Include.jl` file using the `include(...)` function: 

```julia
include("Include.jl");
```

_Discussion_: You should see an error message called a `stack trace.` It gives us a lot of information about what happened, where the error occurred, and potentially how to fix it.
* How do we fix this? Enter the package manager by typing `]` at the `julia>` prompt, and then add the required packages (or directly follow the instructions in the `stack trace`).

__Task 2__: Create an instance of a `Normal` distribution with `μ = 0.20` and `σ = 0.40` using the `build(...)` function. Store the instance in a variable called `d`. For more information on the `Normal` distribution, see [here](https://juliastats.org/Distributions.jl/stable/univariate/#Distributions.Normal).
* `Check`: What is the type of `d`? Use the [typeof function](https://docs.julialang.org/en/v1/base/base/#Core.typeof) to check the type of `d`.
* `Error case`: What happens if you try to create an instance of a `Normal` distribution with `μ = 0.20` and `σ = -0.40`? Try it and see what happens.

__Task 3__: Generate `n = 100` samples from the `Normal` distribution `d` by issuing the command:
    
```julia
x = sample(d);
```

_Discussion_: Let's explore some of the propertoes of the `x` variable, and the `sample(...)` function:
* What is the type of `x`? Use the [typeof function](https://docs.julialang.org/en/v1/base/base/#Core.typeof) to check the type of `x.` 
* How big (number of elements) is `x`? Use the [length function](https://docs.julialang.org/en/v1/base/strings/#Base.length-Tuple{AbstractString}) to check its size. 
* How much memory (in bytes) does `x` occupy? Use the `sizeof(...)` function to check its memory footprint. Do you think this makes sense?
    * Let's get a second opinion; use the [varinfo function](https://docs.julialang.org/en/v1/stdlib/InteractiveUtils/#InteractiveUtils.varinfo) to summarize the variables in the current scope.
* Why didn't we have to pass in the value for the number of samples `n` to the `sample(...)` function?

__Task 4__: Compute the sample mean $\hat{\mu}$ and sample standard deviation $\hat{\sigma}$ of the `x` variable using the [mean](https://docs.julialang.org/en/v1/stdlib/Statistics/#Statistics.mean) and [std](https://docs.julialang.org/en/v1/stdlib/Statistics/#Statistics.std) functions, exported from the [Statistics module](https://docs.julialang.org/en/v1/stdlib/Statistics/#Statistics).
* `Check`: Was the sample mean $\hat{\mu}$ close to the true mean $\mu$? Was the sample standard deviation $\hat{\sigma}$ close to the true standard deviation $\sigma$? How can we fix this?
