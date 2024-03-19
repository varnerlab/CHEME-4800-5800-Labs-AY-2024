# include -
include("Include.jl");

# constants -
number_of_genes = 3;

# ----- PHASE 1: PARAMETERS AND MODEL SETUP START ------------------------------------------------------------------------------- #
ic = zeros(number_of_genes); # setup the initial conditions -
kd = 0.01*ones(number_of_genes); # setup degradation rate constants
dt = 0.1; # setup the time step

# setup data for the model, and then build the model -
α = zeros(number_of_genes + 1, number_of_genes + 1);
α[4,1] = 0.25;
α[1,2] = 0.25;
α[1,3] = 0.25;
α[2,3] = 0.5;
α[3,2] = 0.25;

K = zeros(number_of_genes + 1, number_of_genes + 1);
K[4,1] = 0.1;
K[1,2] = 0.1;
K[1,3] = 0.5;
K[2,3] = 0.1;
K[3,2] = 0.4;

n = zeros(number_of_genes + 1, number_of_genes + 1);
n[4,1] = 1;
n[1,2] = 2;
n[1,3] = 2;
n[2,3] = 2.5;
n[3,2] = 2;

# build the parameters dictionary -
parameters = Dict("α"=>α, "K"=>K, "n"=>n, "kd"=>kd, "activator"=>1.0);

# build the model -
model = build(MySimpleProblemModel, (
    parameters=parameters, initial_conditions=ic, time_span=(0.0, 360.0, dt), model=balances));
# ----- PHASE 1: PARAMETERS AND MODEL SETUP END --------------------------------------------------------------------------------- #

# ----- PHASE 2: SOLVE THE MODEL START ------------------------------------------------------------------------------------------ #
(T,X) = solve(model, solver=MyForwardEulerMethod());

# plot the results -
plot(T, X[:,1], lw=2, c=:blue, xlabel="Time (AU)", ylabel="Concentration (AU)", label="P1");
plot!(T, X[:,2], lw=2, c=:red, label="P2");
plot!(T, X[:,3], lw=2, c=:green, label="P3");
# ----- PHASE 2: SOLVE THE MODEL END -------------------------------------------------------------------------------------------- #
