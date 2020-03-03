class DailyForecast

  def initialize(attributes)
    @five_days = five_days(attributes)
  end

  def five_days(attributes)
    acc = []
    attributes['daily']['data'].each_with_index do |data, index|
      hash = Hash.new
      hash["date_#{index}"] = data["time"]
      hash["icon_#{index}"] = data["icon"]
      hash["summary_#{index}"] = data["summary"]
      hash["precipitation_percentage_#{index}"] = data["precipProbability"]
      hash["high_temperature_#{index}"] = data["temperatureHigh"]
      hash["low_temperature_#{index}"] = data["temperatureLow"]
      acc << hash
    end
    acc[0..4]
  end
end
