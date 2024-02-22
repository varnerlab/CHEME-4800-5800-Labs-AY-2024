# `Lab-5d`: Two-Dimensional Cellular Automata Simulation
The objectives of `lab-5d` are to familiarize students with cellular automata and to develop a simple two-dimensional cellular automata simulation. 
* [Cellular automata (CA)](https://en.wikipedia.org/wiki/Cellular_automaton) are discrete models studied in computer science, physics, and mathematics. They are used to model complex systems, such as the behavior of cells in a biological system, the behavior of particles in a physical system, and the behavior of agents in a computer science system. Let's watch this [introduction video](https://www.youtube.com/watch?v=DKGodqDs9sA) to get a basic idea of cellular automata.

## Tasks
A coworker has provided you with a simple two-dimensional cellular automata simulation system. However, while the simulation logic is complete (i.e., it runs without errors), no other instructions or documentation were provided (only a `sample.jl` script). Your team's task is to analyze this system, starting from the `sample.jl` file, and explain the code's behavior to the class. 

1. __Duration 25 min__: Analyze and discuss the system's behavior by executing the `sample.jl` script.
    * The simulation output is stored in the `root/images` directory. Run the `sample.jl` script with the default rule. What do the images represent that are saved to the `root/images` directory?
    * To see what the simulation is doing, add `@show` statements to the `simulation(...)` function in the `src/Compute.jl` file to print out values.
    * How are the images being written to the `root/images` directory?

1. __Duration 15 min__: Let's change the rules and observe the system's behavior.
    * For example, input the rule:
    ```julia
        rule[1] = 1; # average 0.0 
        rule[2] = 0; # average 0.25 
        rule[3] = 0; # average 0.50 
        rule[4] = 0; # average 0.75
        rule[5] = 1; # average 1.0
    ```
   in the `sample.jl` script and run the `sample.jl` script with this rule. What do you observe? Pick some other rules and observe the behavior of the system.
   * How many possible rules are there for this kind of system?
