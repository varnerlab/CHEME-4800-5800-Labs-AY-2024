# Lab 8b: Iterative Solution of a System of Species Mole Balances
This lab will familiarize students with the iterative solution of a system of steady-state species mole balances for a well-mixed isothermal reaction operation. The steady-state open species mole balances for a well-mixed system with species set $\mathcal{M}$, 
reaction set $\mathcal{R}$, and stream set $\mathcal{S}$ is described by:

$$
\dot{\mathbf{N}}\cdot{\mathbf{d}} + \mathbf{S}\cdot\dot{\mathbf{\epsilon}} = \mathbf{0}
$$

The matrix $\dot{\mathbf{N}}\in\mathbb{R}^{\mathcal{M}\times\mathcal{S}}$ is the species flow matrix, 
$\mathbf{d}\in\mathbb{R}^{\mathcal{S}\times{1}}$ is the stream direction vector,
$\mathbf{S}\in\mathbb{R}^{\mathcal{M}\times\mathcal{R}}$ is the stoichiometric matrix, 
and $\dot{\mathbf{\epsilon}}\in\mathbb{R}^{\mathcal{R}\times{1}}$ is the open reaction extent vector.
The open species mole balances can also be written in index form as:

$$
\sum_{s\in\mathcal{S}}d_{s}\dot{n}_{is} + \sum_{j\in\mathcal{R}}\sigma_{ij}\dot{\epsilon}_{j} = 0\qquad{i=1,2,\dots,\mathcal{M}}
$$

where $\dot{n}_{is}$ is the mole flow rate of species $i$ in stream $s$, $d_{s}$ is the direction of stream $s$,
$\sigma_{ij}$ is the stoichiometric coefficient for species $i$ in reaction $j$, and $\dot{\epsilon}_{j}$ is the open extent of reaction $j$.

## Task 1: Compute the stoichiometric matrix $\mathbf{S}$
__Duration 20 min__: Use your `Lab 7d` implementation to compute the stoichiometric matrix $\mathbf{S}$ for the reactions encoded in the [Toy.net](/data/Toy.net) file.
* Implement the `readreactionfile` function in `src/Files.jl` to read the reaction file and return the reaction dictionary `R,` whose keys are the line number from [Toy.net](/data/Toy.net)   the list of `MyChemicalReactionModel` objects. 
* Implement the `build` method for the `MyStoichiometricMatrixModel` type in `src/Factory.jl` to build the stoichiometric matrix $\mathbf{S}$ from the reaction dictionary `R.` 
* Execute the `testme_task_1.jl` script to test your implementation `Lab 7d` implementation. This will read the reaction file and compute the stoichiometric matrix $\mathbf{S}$.
* The `runme_task_1.jl` script gives an example of how to call your method implementations to read the reaction files and compute the stoichiometric matrix $\mathbf{S}$ associated with the reactions in the [Toy.net](/data/Toy.net) file.

## Task 2: Setup the steady-state species mole balance system matrix $\mathbf{A}$
__Duration 20 min__: Assume that we have three streams in the system: stream 1, stream 2, and stream 3. All species can be transported in all streams. 
No reaction occurs in the streams.
Streams 1 and 2 enter the reactor, and stream three exits the reactor. Show that in the absence of information about the reaction extents or the input or output stream mole flows, the steady-state species mole balances can be written as:

$$
\mathbf{A}\cdot\mathbf{x} = \mathbf{0}
$$

where $\mathbf{A}\in\mathbb{R}^{\mathcal{7}\times\mathcal{24}}$ is the system matrix, and $\mathbf{x}\in\mathbb{R}^{\mathcal{24}\times{1}}$ is the vector of unknowns. To see this, run the `runme_task_2.jl` script to setup the system matrix $\mathbf{A}$ as the block system:

$$
\mathbf{A} = \begin{bmatrix}
\mathbf{S} &|& \mathbf{D}_{1} &|& \mathbf{D}_{2} &|& \mathbf{D}_{3} \\
\end{bmatrix}
$$

where $\mathbf{S}$ is the stoichiometric matrix, and $\mathbf{D}_{1}$, $\mathbf{D}_{2}$, and $\mathbf{D}_{3}$ are diagonal matrices that represent the stream direction vectors for streams 1, 2, and 3, respectively.

### Discussion
* What are the unknowns in the `24`$\times$`1` unknown vector $\mathbf{x}$?
* What is the `rank` of the system matrix $\mathbf{A}$, what does that say about the system of equations? 

## Task 3 (preview of problem set 3): Let's put some numbers in and see what happens.
__Duration 10 min__: Assume that the system has three streams: stream 1, stream 2, and stream 3. All species can be transported in all streams.
Further, we've measured some stream mole flows and want to compute the remaining unknown values (extents and missing mole flows). How do we set up the system matrix $\mathbf{A}$, the vector of unknowns $\mathbf{x}$, and the right-hand side vector $\mathbf{b}$? We've implemented some scenarios in the `runme_task_3.jl` script.
* __Case 1__: Assume we've measured all the inputs and want to estimate the reaction extents and the outputs. How do we set up the system matrix $\mathbf{A}$, the vector of unknowns $\mathbf{x}$, and the right-hand side vector $\mathbf{b}$? (and will the system be solvable?)
* __Case 2__: Assume we've measured all the inputs and some output streams. How do we set up the system matrix $\mathbf{A}$, the vector of unknowns $\mathbf{x}$, and the right-hand side vector $\mathbf{b}$? (and will the system be solvable?). 
    * Enter some numbers into the measurement vector `ndot_measured` and see if the system is solvable using one of our favorite linear algebra solvers.
