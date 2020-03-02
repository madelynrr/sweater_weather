class Restaurant

  attr_reader :name, :address

  def initialize(attributes)
    @name = attributes['name']
    require "pry"; binding.pry
    @address = attributes['location']['display_address'].first + ' ' + attributes['location']['display_address'].second

  end

end
