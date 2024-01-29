function build(distribution::Type{ContinuousUnivariateDistribution}; μ::Float64 = 0.0, σ::Float64 = 1.0)
    return distribution(μ,σ)
end