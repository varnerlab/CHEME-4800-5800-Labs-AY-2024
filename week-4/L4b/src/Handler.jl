function _process_forecast_response(response::String) where T <: AbstractWeatherEndpointModel

    # initialize -
    dataframe = DataFrame();

    # parse the response -
    response_dict = JSON.parse(response);
 
end


function _process_weather_response(model::Type{T}, 
    response::String) where T <: AbstractWeatherEndpointModel

    # initialize -
    type_handler_dict = Dict{Any,Function}()

    # hardcode the response handler -
    type_handler_dict[MyWeatherGridPointEndpointModel] = (x::String) -> JSON.parse(x) # default handler
    type_handler_dict[MyWeatherForecastEndpointModel] = _process_forecast_response # forecast handler

    # lookup the function to handle the response -
    if (haskey(type_handler_dict, model) == true)
        handler_function = type_handler_dict[model]
        return handler_function(response);
    end

    # default: return nothing
    return nothing
end