class DarkSkyService

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_forecast
    Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@long}") do |req|
      req.params['exclude'] = 'minutely'
    end
  end

end
