abstract type AbstractReturnModel end
abstract type AbstractHeuristicProblemModel end
abstract type AbstractSolutionModel end

mutable struct MySingleIndexModel <: AbstractReturnModel

    # model -
    α::Float64          # firm specific unexplained return
    β::Float64          # relationship between the firm and the market
    r::Float64          # risk free rate of return 
    ϵ::Distribution     # random shocks 

    # constructor -
    MySingleIndexModel() = new()
end

mutable struct MySimulatedAnnealingProblem <: AbstractHeuristicProblemModel

    # data -
    number_of_iterations::Int
    number_of_iterations_per_T::Int
    α::Float64
    bounds::Array{Float64,2}

    # constructor -
    MySimulatedAnnealingProblem() = new();
end

mutable struct MySimulatedAnnealingProblemSolution <: AbstractSolutionModel

    # data -
    solution::Array{Float64,1}
    objval::Float64

    # constructor -
    MySimulatedAnnealingProblemSolution() = new();
end