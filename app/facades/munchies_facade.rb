class MunchiesFacade

  attr_reader :id

  def initialize(params)
    @id = nil
    @params = params
  end

def munchies_return
  # weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{destination_lat},#{destination_long},#{arrival_time_unix}") do |req|
  #   req.params['exclude'] = 'minutely'
  # end
  #
  # forecast_summary = JSON.parse(weather_response.body)['hourly']['summary']


  response_hash = {
      "id": nil,
      "type": @params[:food],
      "attributes": {
        "end_location": @params[:end],
        "travel_time": travel_time_text,
        "forecast": forecast_summary},
        "restaurant": {
          "name": restaurant_name,
          "address": restaurant_address
        }
      }


end

  def travel_time_text
    google_maps_parsed_response['routes'].first['legs'].first['duration']['text']
  end

  def travel_time_seconds
    google_maps_parsed_response['routes'].first['legs'].first['duration']['value']

  end

  def google_maps_parsed_response
    start_point = @params[:start]
    end_point = @params[:end]

    google_maps_response = GoogleMapsService.new(start_point, end_point).get_travel_time

    JSON.parse(google_maps_response.body)
  end

  def arrival_time
    Time.now + travel_time_seconds.seconds
  end

  def arrival_time_unix
    arrival_time.to_i
  end

  def google_geocoding_parsed_response
    GeocodingService.new(@params[:end]).get_lat_long
    # JSON.parse(response.body)
  end

  def destination_lat
    JSON.parse(google_geocoding_parsed_response.body)['results'].first['geometry']['location']['lat']
  end

  def destination_long
    JSON.parse(google_geocoding_parsed_response.body)['results'].first['geometry']['location']['lng']
  end


  def yelp_parsed_response
    category = @params[:food]
    response = YelpService.new(destination_lat, destination_long, category, arrival_time_unix).return_restaurant
    JSON.parse(response.body)
  end

  def restaurant
    yelp_parsed_response['businesses'].first
  end

  def restaurant_name
    restaurant['name']
  end

  def restaurant_address
    restaurant['location']['display_address'].first + ' ' + restaurant['location']['display_address'].second
  end

  def weather_response
    response = DarkSkyService.new(destination_lat, destination_long, arrival_time_unix).get_future_forecast
    JSON.parse(response.body)
  end

  def forecast_summary
    weather_response['hourly']['summary']
  end



end
