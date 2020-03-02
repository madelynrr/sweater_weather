class Restaurant

  attr_reader :name, :address

  def initialize(attributes)
    @name = ['name']
    @address = attributes['location']['display_address'].first + ' ' + attributes['location']['display_address'].second

  end

end
