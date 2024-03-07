# `Lab 7d`: Build a Better Stoihiometric Matrix System
In this lab, you will build a better implementation of a program to construct a stoichiometric matrix system for the [E. coli core metabolic network](https://pubmed.ncbi.nlm.nih.gov/26443778/).

## Preqrequisites
In `L7c` we built the stoichiometric matrix for a simple chemical reaction network (that implementation can be found [here](https://github.com/varnerlab/CHEME-4800-5800-Examples-AY-2024)). However, when I applied the `time machine test` to that code base, it failed. 
* The `time machine test` is a simple test that I use to determine if a code base is well-structured and easy to maintain. The test is simple: I take the code base and put it in a time machine, and then I travel 10 years into the future. When I arrive, I ask myself if I can understand the code base and make changes to it. If the answer is no, then the code base fails the `time machine test`.

## Task 1: Build a better stoichiometric matrix system
__Duration:__ 40 minutes: Finish the implementation of the `_compute_stoichiometric_matrix` method in the `src/Compute.jl` class. 
* The `_compute_stoichiometric_matrix` function takes the `reactions::Dict{Int64, MyChemicalReactionModel}` dictionary as an input and returns the stoichiometric matrix as an `Array{Float64,2}`, a list of chemical species names as an `Array{String,1}` and a list of reaction names as an `Array{String,1}`.
* You can run the `testme_task_1.jl` script to check your implementation. The solution is provided in the `solutions` directory.

## Task 2: Visualize the reaction adjacency matrix for the E. coli core metabolic network
1. 