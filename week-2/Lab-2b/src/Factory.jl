function build(distribution::Type{T}; μ::Float64 = 0.0, σ::Float64 = 1.0)::ContinuousUnivariateDistribution where T <: ContinuousUnivariateDistribution
    
    # check: should we check to see if the parameters are valid?
    # ...

    # this will return a distribution of type T
    return distribution(μ,σ)
end