# `Lab 7d`: Build a Better Stoichiometric Matrix System
In this lab, you will better implement a program to construct a stoichiometric matrix system described in the paper:

* [Orth JD, Fleming RM, Palsson BØ. Reconstruction and Use of Microbial Metabolic Networks: the Core Escherichia coli Metabolic Model as an Educational Guide. EcoSal Plus. 2010 Sep;4(1). doi: 10.1128/ecosalplus.10.2.1. PMID: 26443778.](https://pubmed.ncbi.nlm.nih.gov/26443778/)

The `PDF` of the paper is availabe [here](orth-et-al-2010-reconstruction-and-use-of-microbial-metabolic-networks-the-core-escherichia-coli-metabolic-model-as-an.pdf)

## Preqrequisites
In `L7c`, we built the stoichiometric matrix for a simple chemical reaction network (that implementation can be found [here](https://github.com/varnerlab/CHEME-4800-5800-Examples-AY-2024)). However, it failed when I applied the `time machine test` to that code base. 
* The `time machine test` is a simple test that I use to determine if a code base is well-structured and easy to maintain. The test is simple: I take the code base and put it in a time machine, then travel 10 years into the future. When I arrive, I ask myself if I can understand the code base and make changes to it. If the answer is no, the code base fails the `time machine test.`

## Task 1: Build a better stoichiometric matrix system
__Duration:__ 45 minutes: Finish implementing the `_compute_stoichiometric_matrix` method in the `src/Compute.jl` class. 
* The `_compute_stoichiometric_matrix` function takes the `reactions::Dict{Int64, MyChemicalReactionModel}` dictionary as an input and returns the stoichiometric matrix as an `Array{Float64,2}`, a list of chemical species names as an `Array{String,1}` and a list of reaction names as an `Array{String,1}`.
* You can run the `testme_task_1.jl` script to check your implementation. The solution is provided in the `solutions` directory.

## Task 2: Visualize the reaction adjacency matrix for the _E. coli_ core metabolic network
Let's visualize the reaction adjacency matrix for the _E. coli_ core metabolic network. We'll do this together in class. 
The reaction adjacency matrix $\mathbf{A}$ is computed from the binary stoichiometric matrix $\mathbf{B}$:

$$
\begin{equation}
\mathbf{A} = \mathbf{B}^T\cdot\mathbf{B}
\end{equation}
$$

The binary stoichiometric matrix $\mathbf{B}$ is computed from the stoichiometric matrix $\mathbf{S}$ where `B[i,j] = 1` if `S[i,j] != 0` and `B[i,j] = 0` otherwise. 
* We've implemented the `binary_stoichiometric_matrix(matrix::Array{Float64,2})::Array{Int64,2}` method in the `src/Compute.jl` file to compute the binary stoichiometric matrix $\mathbf{B}$.
* The `runme_task_2.jl` script computes $\mathbf{B}$, the reaction adjacency matrix $\mathbf{A}$, and visualizes the reaction adjacency matrix as an undirected graph. It saves a file called `EcoliNetwork.pdf` in the `root` directory.
