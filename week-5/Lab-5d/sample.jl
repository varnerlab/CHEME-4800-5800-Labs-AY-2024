# include -
include("Include.jl");

# parameters -
number_of_rows = 256;
number_of_columns = 256;
middle = (number_of_rows / 2) |> Int
number_of_iterations = 960;
exportonlyeven = false;

# build a rule -
rule = Dict{Int64,Int64}();
rule[1] = 1; # average 0.0 
rule[2] = 0; # average 0.25 
rule[3] = 1; # average 0.50 
rule[4] = 1; # average 0.75
rule[5] = 1; # average 1.0
rulemodel = build(MyTwoDimensionalGridWorldRuleModel, rule);

# let's build a world, and set the initial state -
state = Dict{Tuple{Int64,Int64},Int64}();
for row ∈ 1:number_of_rows
    for column ∈ 1:number_of_columns
        if (row == middle && column == middle)
            state[(row, column)] = 1;
        else
            state[(row, column)] = 0;
        end
    end
end
world = build(MyTwoDimensionalGridWorldModel, number_of_rows, number_of_columns, state);

# run the simulation -
frames = simulation(world, rulemodel, number_of_iterations=number_of_iterations);

# export -
exportframes(world, frames, exportonlyeven=exportonlyeven);