class TravelForecast

  def initialize(attributes)
    @summary = attributes['hourly']['summary']
    @temperature = attributes['hourly']['data'].first['temperature']
  end

end
