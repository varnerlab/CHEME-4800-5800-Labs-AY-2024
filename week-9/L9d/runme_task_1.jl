# include -
include("Include.jl");

# Simulate Glucose (1) Xylose (2) fermentation, Fig 6 of Kompala et al. 1986

# setup the parameters for the model -
α = [1e-3,1e-3];
β = [0.05,0.05];
K = [0.01,0.2];
K̂ = [0.01,0.2];
μmax = [1.08,0.82];
Y = [0.52,0.5];
emax = [
    α[1]/(μmax[1] + β[1]),
    α[2]/(μmax[2] + β[2])
];

p = Array{Any,1}(undef,8)
p[1] = α
p[2] = β
p[3] = K
p[4] = K̂
p[5] = μmax
p[6] = Y
p[7] = emax
p[8] = 2; # number of enzymes

# setup the initial conditions -
xₒ = [
    0.5;            # 1 S₁
    2.5;            # 2 S₂
    0.90*emax[1];   # 3 E₁
    0.18*emax[2];   # 4 E₂
    4e-3;           # 5 C
];

# call the ODE solver -
tspan = (0.0,10.0);
prob = ODEProblem(balances, xₒ, tspan, p);
soln = solve(prob, RK4(), reltol=1e-8, abstol=1e-8);

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
