class ForecastFacade

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def forecast_results
    daily_forecast
    # hourly_forecast
    # daily_forecast
  end

  def daily_forecast

    # response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
    #   req.params['key'] = ENV['GOOGLE_GEOCODING_API_KEY']
    #   req.params['address'] = location
    # end
    #
    # lat = JSON.parse(response.body)['results'].first['geometry']['location']['lat']
    # long = JSON.parse(response.body)['results'].first['geometry']['location']['lng']
    # country = JSON.parse(response.body)['results'].first['address_components'][3]['long_name']


    # weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}") do |req|
    #   req.params['exclude'] = 'minutely'
    # end
    #
    # response_body = JSON.parse(weather_response.body)


    daily_forecast = DailyForecast.new(forecast_information, location, country)
  end

  def forecast_information
    # weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}") do |req|
    #   req.params['exclude'] = 'minutely'
    # end

    JSON.parse(weather_response.body)
  end

  def weather_response
    DarkSkyService.new(lat, long).get_forecast
    # weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}") do |req|
    #   req.params['exclude'] = 'minutely'
    # end
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
    # Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
    #   req.params['key'] = ENV['GOOGLE_GEOCODING_API_KEY']
    #   req.params['address'] = location
    # end
  end

end
