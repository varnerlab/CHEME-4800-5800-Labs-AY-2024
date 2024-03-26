# run task 1 -
include("runme_task_1.jl");

# Compute the *expected* θ vector for each firm in our dataset, and store in a dictionary -
parameters_matrix = Dict{String,Array{Float64,1}}();
for ticker ∈ my_list_of_tickers

    # what index is this ticker?
    ticker_index = findfirst(x->x==ticker, my_list_of_tickers);

    # compute the expected θ vector for this firm -
    parameters_matrix[ticker] = θ(market_matrix, ticker_index, rG);
end
