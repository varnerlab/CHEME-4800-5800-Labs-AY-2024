include("runme_task_1.jl"); # solve the model equations

# plot the results -
plot(T,X[:,1], c=:red, label="S₁(t)", xlabel="Time (hrs)", ylabel="Concentration (g/L)", lw=3)
plot!(T,X[:,2], c=:blue, label="S₂(t)", lw=3)
plot!(T,X[:,5], c=:green, label="C(t)", lw=3)

