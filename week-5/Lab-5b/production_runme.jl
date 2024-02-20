# include the Include.jl -
include("Include.jl")

# Step 1: load the reaction file 
path_to_reactions_file = joinpath(_PATH_TO_DATA, "Reactions.net")

# Step 2: parse the list of chemical reaction strings -
reactions = read_reaction_file(path_to_reactions_file);

# TODO: Build the reaction_name_array -
# ...

# TODO: Build the species_formula_array -
# ...

# TODO: Challenge problem: build the stoichiometry_matrix
# ...