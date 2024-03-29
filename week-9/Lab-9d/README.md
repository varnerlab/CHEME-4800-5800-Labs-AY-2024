# Lab 9d: Simulation of the Growth of _Klebsiella oxytoca_ on Sugar Mixtures in Batch Cultures
This lab will familiarize students with the solution of the Kompala Cybernetic Model for the batch growth of _Klebsiella oxytoca_ on sugar mixtures using the [DifferentialEquations.jl](https://diffeq.sciml.ai/stable/) package. The model is described [here](paper/Kompala-BiotechBioengineering-1986.pdf).

## Prerequisites
I've already set up the model equations and the `balances` function, which takes the system state, i.e., concentrations and simulation parameters, and evaluates the right-hand side of the model differential equations. The model can be found in the [Kompala.jl file](src/Kompala.jl). 
* In this lab, you will write code that interfaces these model equations with the solvers from the [DifferentialEquations.jl](https://diffeq.sciml.ai/stable/) package. Thus, in our `buy-vs-build` decision, we have chosen to `buy` a differential equation solver.

## Tasks
1. __Duration 45 min__: Complete the implementation of the `runme_task_1.jl`, and execute the script. The script will generate use the [DifferentialEquations.jl](https://diffeq.sciml.ai/stable/) package to solve the model equations, producing a time array `T` and a state array `X` holding the model solutions. 

   * Fill in the missing model parameters in the `runme_task_1.jl` script. The parameters can be obtained from the paper. We will simulate `Fig. 6` of the paper. Let glucose be state index `1` and xylose state `2`. The pseudo enzyme for glucose $e_{1}$ will be index `3`. The pseudo enzyme for xylose $e_{2}$ will be index `4`, and the biomass $C$ will be index `5`.
   * Fill in the missing details on how to set up and call the `solve` function of the `DifferentialEquations.jl` package. Use the [Runge-Kutta fourth order (RK4) solver](https://en.wikipedia.org/wiki/Runge–Kutta_methods), and simulate for time `tspan = (0.0,10.0)`. See the [DifferentialEquations.jl documentation](https://diffeq.sciml.ai/stable/) for more details. The ' solutions ' directory provides a completed `runme_task_1.jl` script.

3. __Duration 5 min__: Once you have completed the script, execute the script. The script will generate a time array `T` and a state array `X` holding the model solutions. 

4. __Optional__: You can visualize the model solutions using the `Plots.jl` package. Uncomment the `using Plots` and `using Colors` lines in the `Include.jl` file. Then, execute the `plotme_task_1.jl` script. This script will visualize our `Fig. 6` simulation from the Kompala paper.
