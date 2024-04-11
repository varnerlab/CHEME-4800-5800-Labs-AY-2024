# Lab 12d: Estimate an Optimal Stock Allocation using Cobb-Douglas Utility Maximization and Simulated Annealing
`Lab 12d` will familirize students with the concept of Cobb-Douglas utility maximization and simulated annealing. Students will use these concepts to estimate an optimal stock allocation in portfilio $\mathcal{P}$, where we will assume that the utility function is given by the Cobb-Douglas utility function:

$$
U(n_1, n_2, \dots, n_{P}) = \prod_{i\in\mathcal{P}} n_i^{\gamma_i}
$$

where $n_i$ is number of shares invested in stock $i$, and $\gamma_i$ is the coefficient of stock $i$ in the utility function. The goal is to find the optimal stock allocation that maximizes the utility function, subject to a budget constraint of the form:

$$
\sum_{i\in\mathcal{P}} {n_i}\cdot{S_i} = B
$$

where $S_i$ is the share price of stock $i$, and $B$ is the budget. We will use simulated annealing to estimate the optimal stock allocation where we assume a budget of $B=1000$ `USD` and a model of $\gamma_i$ of the form:

$$
\gamma_i = \max(0,\,\frac{\mathbb{E(R_{i})}}{\beta_{i}})
$$

where $\mathbb{E}(R_{i})$ is the expected excess return of stock $i$, and $\beta_{i}$ is the $\beta$-parameter for stock $i$. 

## Tasks
1. __Duration 20 min__: Read the [Simulated Annealing material on our online notes](https://varnerlab.github.io/CHEME-4800-5800-ComputingBook/unit-3-learning/combitorial.html#simulated-annealing).
1. __Duration 10 min__: Finish the implementation of the `runme_task_2.jl` script that computes the [single index model](https://en.wikipedia.org/wiki/Single-index_model) for each stock in the [SP500](https://en.wikipedia.org/wiki/S&P_500) index. See `Lab 10b`. The solution for this task is provided in the `solutions` folder.
2. __Duration 10 min__: In the `runme_task_3.jl` script, construct a `MySimulatedAnnealingProblem` instance with `number_of_iterations = 100`,
`number_of_iterations_per_T = 100`, `α = 0.999` and `bounds = bounds`.
3. __Duration 10 min__: Execute the `testme_task_3.jl` script. Do you get the expected output, i.e., pass the tests?
    - This script calls the `runme_task_3.jl` script and checks if the output is as expected, i.e., the budget constraint is satisfied and we compute the objective function correctly. 

## Disclaimer and Risks
__This content is offered solely for training and  informational purposes__. No offer or solicitation to buy or sell securities or derivative products, or any investment or trading advice or strategy,  is made, given, or endorsed by the teaching team. 

__Trading involves risk__. Carefully review your financial situation before investing in securities, futures contracts, options, or commodity interests. Past performance, whether actual or indicated by historical tests of strategies, is no guarantee of future performance or success. Trading is generally inappropriate for someone with limited resources, investment or trading experience, or a low-risk tolerance.  Only risk capital that is not required for living expenses.

__You are fully responsible for any investment or trading decisions you make__. Such decisions should be based solely on your evaluation of your financial circumstances, investment or trading objectives, risk tolerance, and liquidity needs.