
function url(base::String, model::MyWeatherGridPointEndpointModel)::String

    # get data -
    latitude = model.latitude;
    longitude = model.longitude;

    # build the base url -
    url_string = "$(base)/points/$(latitude),$(longitude)";

    # return -
    return url_string;
end