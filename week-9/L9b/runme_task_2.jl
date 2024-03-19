include("runme_task_1.jl"); # this will run the first task, and generate the data

# TODO: set the activator to 0.0, and set the initial conditions to the last setup, and update the time_span
throw(ArgumentError("You need to finish the implementation of the runme_task_2.jl script!"));

# build a new model -
model_washout = build(MySimpleProblemModel, (
    parameters=parameters, initial_conditions=ic, time_span=time_span, model=balances));

# solve the model -
(T_washout,X_washout) = solve(model_washout, solver=MyForwardEulerMethod());

# plot the results -
plot!(T_washout, X_washout[:,1], lw=2, c=:blue, xlabel="Time (AU)", ylabel="Concentration (AU)", label="");
plot!(T_washout, X_washout[:,2], lw=2, c=:red, label="");
plot!(T_washout, X_washout[:,3], lw=2, c=:green, label="");