# include -
include("Include.jl");

# -- DO NOT EDIT BELOW THIS LINE -------------------------------------------------------------------------------------- #
function _objfunc(n::Array{Float64,1}, γ::Array{Float64,1}, price::Array{Float64,1}, budget::Float64; 
    λ::Float64 = 1000.0)::Float64

    # initialize -
    U = 1.0;
    B = 0.0;

    # compute the utility term
    [U *= n[i]^γ[i] for i ∈ eachindex(n)]

    # compute the budget term -
    [B += price[i]*n[i] for i ∈ eachindex(n)];

    # return -
    return U - λ*(B - budget)^2;
end

# initialize -
total_budget = 1000.0; # suppose we have $1000 to invest
path_to_sims_file = joinpath(_PATH_TO_MY_SIMS, "SIMs-Lab-12d.jld2");
models = load(path_to_sims_file) |> x->x["sims"]; # load the model dataset -
ERₘ = load(path_to_sims_file) |> x->x["market"]; # load the expected market return -
lastprice = load(path_to_sims_file) |> x->x["lastprice"]; # load the last price quote -
your_list_of_tickers = ["JNJ", "AMD", "MU", "NVDA", "AAPL", "MSFT", "NFLX", "T"]; # what tickers am I interested?

# compute the coefficient in the Cobb-Douglas utility function -
γ = zeros(length(your_list_of_tickers));
for i ∈ eachindex(your_list_of_tickers)
    ticker = your_list_of_tickers[i];
    sim_model = models[ticker];
    α = sim_model.α;
    β = sim_model.β;
    γ[i] = max(0.0, α/β + ERₘ);
end

# compute the last price quote -
Sₒ = zeros(length(your_list_of_tickers));
for i ∈ eachindex(your_list_of_tickers)
    ticker = your_list_of_tickers[i];
    Sₒ[i] = lastprice[ticker];
end
# -- DO NOT EDIT ABOVE THIS LINE -------------------------------------------------------------------------------------- #


# compute the bounds -
bounds = zeros(length(your_list_of_tickers), 2);
for i ∈ eachindex(your_list_of_tickers)
    if (γ[i] == 0.0)
        bounds[i, 2] = 0.001; # some small value
    else
        bounds[i, 2] = 1000.0;
    end
end

# build problem -
# TODO: build the problem model of type MySimulatedAnnealingProblem
# The problem model should be stored in the variable problem


# alias the objective function -
λ̂ = 100.0;
objfunc = x-> _objfunc(x, γ, Sₒ, total_budget, λ = λ̂);

# solve the problem -
nₒ = rand(1.0:10.0, length(your_list_of_tickers));
(soln, archive) = solve(problem, nₒ, objfunc);