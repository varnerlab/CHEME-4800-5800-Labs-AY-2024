# include -
include("Include.jl"); # run task three, and test some results -

# ----------------------------------------------------------------------------------
# for more information on tests, see: https://docs.julialang.org/en/v1/stdlib/Test/
# ----------------------------------------------------------------------------------

@testset verbose = true "Test SA algorithm" begin

    # run task 3 -
    include("runme_task_3.jl"); # run the SA algorithm

    # get the solution -
    n = soln.solution;

    # is the budget constraint satisfied?
    @test isapprox(sum(n.*Sₒ), total_budget, atol=1e-3);

    # test, is the objective function value correct?
    computed_objval = _objfunc(n, γ, Sₒ, total_budget, λ = λ̂);
    @test isapprox(computed_objval, soln.objval, atol=1e-3);
end