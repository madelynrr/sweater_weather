class GeocodingService

  def initialize(location)
    @location = location
  end

  def get_lat_long
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['key'] = ENV['GOOGLE_GEOCODING_API_KEY']
      req.params['address'] = @location
    end
  end
end
