function sample(distribution::ContinuousUnivariateDistribution, number_of_samples::Int64 = 100)
    return rand(distribution, number_of_samples) 
end