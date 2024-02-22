# include -
include("Include.jl");

# build a rule -
rule = Dict{Int64,Int64}();
rule[1] = 1; # average 0.0 
rule[2] = 0; # average 0.2 
rule[3] = 1; # average 0.4 
rule[4] = 0; # average 0.6
rule[5] = 0; # average 0.8
rule[6] = 1; # average 1.0
rulemodel = build(MyTwoDimensionalGridWorldRuleModel, rule);

# let's build a world -
number_of_rows = 10;
number_of_columns = 10;
state = Dict{Tuple{Int64,Int64},Int64}();
for row ∈ 1:number_of_rows
    for column ∈ 1:number_of_columns
        if (row == 5 && column == 5)
            state[(row, column)] = 1;
        else
            state[(row, column)] = 0;
        end
    end
end
world = build(MyTwoDimensionalGridWorldModel, number_of_rows, number_of_columns, state);

# run the simulation -
frames = simulation(world, rulemodel, number_of_iterations=1);