class TravelTime

  def initialize(attributes)
    @attributes = attributes
  end

  def text
    @attributes['routes'].first['legs'].first['duration']['text']
  end

  def unix_time
      travel_time_seconds = @attributes['routes'].first['legs'].first['duration']['value']
      arrival_time = Time.now + travel_time_seconds.seconds
      arrival_time.to_i
  end

end
