class RoadTripFacade

  attr_reader :id

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
  end

  def road_trip
    RoadTrip.new(@origin, @destination, travel_time.text)
  end

  def parsed_duration_response
    duration_response = GoogleMapsService.new(@origin, @destination).get_travel_time
    JSON.parse(duration_response.body)
  end

  def travel_time
    TravelTime.new(parsed_duration_response)
  end

  def destination_parsed_response
    destination_response = GeocodingService.new(@destination).get_lat_long
    JSON.parse(destination_response.body)
  end

  def travel_destination
    Destination.new(destination_parsed_response)
  end

  def weather_parsed_response
    weather_response = DarkSkyService.new(travel_destination.lat, travel_destination.long, travel_time.unix_time).get_future_forecast
    JSON.parse(weather_response.body)
  end

  def travel_forecast
    TravelForecast.new(weather_parsed_response)
  end
end
