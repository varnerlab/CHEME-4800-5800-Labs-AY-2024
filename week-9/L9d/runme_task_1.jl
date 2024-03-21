# include -
include("Include.jl");

# --- PHASE 1 START: setup the parameters for the model ----------------------------------------------------------------- #
# TODO: setup the parameters for the model for the case in Fig 6 of Kompala et al. 1986. 
α = nothing; # enzyme synthesis rate constants
β = nothing; # enzyme degradation rate constants
K = nothing; # saturation constants for growth on various sugars
K̂ = nothing; # saturation constants for enzyme synthesis
μmax = nothing; # maximum specific growth rates
Y = nothing;    # yield coefficients
emax = nothing; # maximum enzyme concentrations

# store the parameters the p-vector
p = Array{Any,1}(undef,8)
p[1] = α
p[2] = β
p[3] = K
p[4] = K̂
p[5] = μmax
p[6] = Y
p[7] = emax
p[8] = 2; # number of enzymes

# TODO: setup the initial conditions for Fig 6 of Kompala et al. 1986
xₒ = nothing;
# --- PHASE 1 STOP: setup the parameters for the model ------------------------------------------------------------ #

# --- PHASE 2 START: call the ODE solver -------------------------------------------------------------------------- #
tspan = nothing; # time span for the simulation: Tuple of (start_time, end_time)
prob = ODEProblem(balances, xₒ, tspan, p);

# TODO: call the ODE solver using the RK4() method
# see DifferentialEquations.jl documentation for more details, https://diffeq.sciml.ai/stable/
soln = nothing;

# get the results from the solver -
T,X = nothing;
if (soln === nothing)
    println("Error: call to the ODE solver failed.")
else
    # build soln and time arrays -
    T = soln.t
    tmp = soln.u
    number_of_time_steps = length(T)
    number_of_dynamic_states = length(xₒ)
    X = Array{Float64,2}(undef, number_of_time_steps,  number_of_dynamic_states);
    for i ∈ 1:number_of_time_steps
        soln_vector = tmp[i]
        for j ∈ 1:number_of_dynamic_states
            X[i,j] = soln_vector[j]
        end
    end
end
# --- PHASE 2 STOP: call the ODE solver -------------------------------------------------------------------------- #