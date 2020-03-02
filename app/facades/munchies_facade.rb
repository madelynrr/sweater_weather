class MunchiesFacade

  attr_reader :id

  def initialize(params)
    @id = nil
    @params = params
  end

def munchies_return
  travel_time_text
  travel_time_seconds
  arrival_time
  arrival_time_unix

  end_point = @params[:end]



  destination_lat_long = GeocodingService.new(end_point).get_lat_long

  destination_lat = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lat']

  destination_long = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lng']

  yelp_response = Faraday.get('https://api.yelp.com/v3/businesses/search?&open_at') do |req|
    req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
    req.params['term'] = 'restaurants'
    req.params['latitude'] = destination_lat
    req.params['longitude'] = destination_long
    req.params['categories'] = @params[:food]
    req.params['open_at'] = arrival_time_unix
  end

  restaurant = JSON.parse(yelp_response.body)['businesses'].first

  restaurant_name = restaurant['name']
  restaurant_address = restaurant['location']['display_address'].first + ' ' + restaurant['location']['display_address'].second


  weather_response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{destination_lat},#{destination_long},#{arrival_time_unix}") do |req|
    req.params['exclude'] = 'minutely'
  end

  forecast_summary = JSON.parse(weather_response.body)['hourly']['summary']


  response_hash = {
      "id": nil,
      "type": @params[:food],
      "attributes": {
        "end_location": end_point,
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

# def g



# destination_lat_long = GeocodingService.new(end_point).get_lat_long
#
# destination_lat = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lat']
#
# destination_long = JSON.parse(destination_lat_long.body)['results'].first['geometry']['location']['lng']


end
