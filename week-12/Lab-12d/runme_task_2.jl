# run task 1 -
include("runme_task_1.jl");

# Let's specify a regularization parameter -
λ = 1.0;

# Compute the *expected* θ vector for each firm in our dataset, and store in a dictionary
# using the θ function using matrix inv calculation directly 
parameters_dictionary = Dict{String, MySingleIndexModel}();

# TODO: estimate the (α, β) parameters for each firm in the dataset (my_list_of_tickers)
# The parameters for each firm should be stored in an MySingleIndexModel object
# The MySingleIndexModel instances should be stored in the parameters_dictionary dictionary, where the key is the ticker

# dump the file to disk -
save(joinpath(_PATH_TO_MY_SIMS, "SIMs-Lab-12d.jld2"), Dict("sims" => parameters_dictionary, 
    "market" => mean(Rₘ), "lastprice" => price));