class ForecastFacade

  attr_reader :id, :location

  def initialize(location)
    @id = nil
    @location = location
  end

  def current_forecast
    CurrentForecast.new(forecast_information, location, country)
  end

  def hourly_forecast
    HourlyForecast.new(forecast_information)
  end

  def forecast_information
    JSON.parse(weather_response.body)
  end

  def weather_response
    DarkSkyService.new(lat, long).get_forecast
  end

  def lat
    JSON.parse(geocode_response.body)['results'].first['geometry']['location']['lat']
  end

  def long
    JSON.parse(geocode_response.body)['results'].first['geometry']['location']['lng']
  end

  def country
    JSON.parse(geocode_response.body)['results'].first['address_components'][3]['long_name']
  end

  def geocode_response
    GeocodingService.new(location).get_lat_long
  end
end
