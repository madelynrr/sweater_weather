class HourlyForecast

  def initialize(attributes)
    @attributes = attributes
    @eight_hours = eight_hours
  end

  def eight_hours
    acc = []
    8.times do @attributes['hourly']['data'].each_with_index do |data, index|
      hash = Hash.new
      hash["time_#{index}"] = data["time"]
      hash["temperature_#{index}"] = data["temperature"]
      acc << hash
    end
  end

    acc
    require "pry"; binding.pry
    # @attributes['hourly']['data'].reduce([]) do |acc, data|
    #   acc["time"]
    # end

  end

end
