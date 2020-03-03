class HourlyForecast

  def initialize(attributes)
    # @attributes = attributes
    @eight_hours = eight_hours(attributes)
  end

  def eight_hours(attributes)
    acc = []
    attributes['hourly']['data'].each_with_index do |data, index|
      hash = Hash.new
      hash["time_#{index}"] = data["time"]
      hash["temperature_#{index}"] = data["temperature"]
      acc << hash
    end
    acc[0..7]
  end
end
