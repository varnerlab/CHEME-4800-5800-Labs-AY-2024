# include the Include.jl -
include("Include.jl")

# Step 1: load the reaction file 
path_to_reactions_file = joinpath(_PATH_TO_DATA, "Reactions.net")

# Step 2: parse the list of chemical reaction strings -
reactions = read_reaction_file(path_to_reactions_file);

# Make the reaction name array =
reaction_name_array = Array{String,1}();
for (k, v) in reactions
    push!(reaction_name_array, k);
end

# Generate a species list from the reaction strings -
species = Array{String, 1}();
for i ∈ eachindex(reaction_name_array)
    reaction_model = reactions[reaction_name_array[i]];
    
    # process the reactants -
    d = recursivesplit(reaction_model.reactants, delim='+');
    for (k,v) ∈ d
        if (v ∉ species)
            push!(species, v)
        end
    end

    # process the products -
    d = recursivesplit(reaction_model.products, delim='+');
    for (k,v) ∈ d
        if (v ∉ species)
            push!(species, v)
        end
    end
end

# Step 3: Cut the reaction and product strings around the +'s (using recursive descent parser)
