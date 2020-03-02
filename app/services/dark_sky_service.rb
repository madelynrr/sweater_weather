class DarkSkyService

  def initialize(lat, long, arrival_time = nil)
    @lat = lat
    @long = long
    @arrival_time = arrival_time
  end

  def get_forecast
    Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@long}") do |req|
      req.params['exclude'] = 'minutely'
    end
  end

  def get_future_forecast
    Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@long},#{@arrival_time}") do |req|
      req.params['exclude'] = 'minutely'
    end
  end

end
