class GoogleMapsService

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end

  def get_travel_time
    duration_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['key'] = ENV['GOOGLE_DIRECTIONS_API_KEY']
      req.params['origin'] = @start_point
      req.params['destination'] = @end_point
    end
  end

end
