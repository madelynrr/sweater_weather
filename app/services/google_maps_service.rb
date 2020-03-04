class GoogleMapsService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_travel_time
    Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['key'] = ENV['GOOGLE_DIRECTIONS_API_KEY']
      req.params['origin'] = @origin
      req.params['destination'] = @destination
    end
  end

end
