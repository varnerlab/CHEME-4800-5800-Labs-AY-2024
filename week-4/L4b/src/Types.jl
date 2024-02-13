abstract type AbstractWeatherEndpointModel end

mutable struct MyWeatherGridPointEndpointModel <: AbstractWeatherEndpointModel
end

mutable struct MyWeatherForecastEndpointModel <: AbstractWeatherEndpointModel
    MyWeatherForecastEndpointModel() = new(); # empty
end