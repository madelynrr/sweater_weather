class Destination

  attr_reader :lat, :long

  def initialize(attributes)
    @lat = attributes['results'].first['geometry']['location']['lat']
    @long = attributes['results'].first['geometry']['location']['lng']
  end

end
