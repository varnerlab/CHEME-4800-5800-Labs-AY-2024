function _http_get_call_with_url(url::String)::Some{Union{ErrorException, String}}

    try

        # should we check if this string is formatted as a URL?
        if (occursin("https://", url) == false)
            throw(ArgumentError("url $(url) is not properly formatted"))
        end

        # ok, so we are going to make a HTTP GET call with the URL that was passed in -
        # we want to handle the errors on our own, so do NOT have HTTP.jl throw an excpetion -
        response = HTTP.request("GET", url; status_exception = false)

        # return the body -
        return Some(String(response.body))
    catch error

        # get the original error message -
        error_message = sprint(showerror, error, catch_backtrace())
        vl_error_obj = ErrorException(error_message)

        # Package the error -
        return Some(vl_error_obj)
    end
end

function _api(model::Type{T}, complete_url_string::String;
    handler::Function = _default_handler_process_weather_response) where T <: AbstractWeatherEndpointModel

    # execute -
    result_model = _http_get_call_with_url(complete_url_string);
    result_string = nothing
    if (result_model |> something isa ErrorException)
        @show "Error: $(result_model |> something)"
    elseif (result_model |> something isa Nothing)
        @show "Error: unknown error"
    else
       result_string = result_model |> something
    end

    # process and return -
    return handler(model, result_string)
end

# New pattern: This makes it look we are calling a method on an struct, but we are not. 
# We are using the Julia type system (and something called multiple dispatch) to call the correct method.
# For more information on multiple dispatch, see: https://docs.julialang.org/en/v1/manual/methods/#Defining-Methods
(endpoint::Type{T})(url::String; handler::Function = _default_handler_process_weather_response) where T <: AbstractWeatherEndpointModel = _api(endpoint, url, handler = handler)