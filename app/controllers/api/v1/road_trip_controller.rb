class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params[:origin]
    destination = params[:destination]

    duration_response = GoogleMapsService.new(origin, destination).get_travel_time

    parsed_response = JSON.parse(duration_response.body)

  travel_time_text = parsed_response['routes'].first['legs'].first['duration']['text']

  travel_time_seconds = parsed_response['routes'].first['legs'].first['duration']['value']
  arrival_time = Time.now + travel_time_seconds.seconds
  arrival_time_unix = arrival_time.to_i

  destination_lat_long = GeocodingService.new(destination).get_lat_long
  destination_lat = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lat']

  destination_long = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lng']


  weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{destination_lat},#{destination_long},#{arrival_time_unix}") do |req|
    req.params['exclude'] = 'minutely'
  end

  forecast_icon = JSON.parse(weather_response.body)['hourly']['icon']
  forecast_summary = JSON.parse(weather_response.body)['hourly']['summary']





  render json: {
    "origin": origin,
    "destination": destination,
    "travel_time": travel_time_text,
    "forecast": {
      "icon": forecast_icon,
      "summary": forecast_summary
    }
  }



  end

end
