class ForecastFacade

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def forecast_results
    response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['key'] = ENV['GOOGLE_GEOCODING_API_KEY']
      req.params['address'] = location
    end

    lat = JSON.parse(response.body)['results'].first['geometry']['location']['lat']
    long = JSON.parse(response.body)['results'].first['geometry']['location']['lng']


    weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{long}") do |req|
      req.params['exclude'] = 'minutely'
    end

    response_body = JSON.parse(weather_response.body)

    forecast = Forecast.new(response_body)

    require "pry"; binding.pry

    # render json: weather_response.body

  end

end
