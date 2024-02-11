# include -
include("Include.jl");

# let's get the data for Ithaca, NY -
model = MyWeatherGridPointEndpointModel(latitude = 42.443962, longitude = -76.501884);

# Build the URL -
url_string = url("https://api.weather.gov", model);

# make the api call, process the response, and return the result -
result = api(MyWeatherGridPointEndpointModel, url_string);

# grab the forcast, and call api again -
forecast_url = result["properties"]["forecastHourly"];
result_forecast = api(MyWeatherForcastEndpointModel, forecast_url);