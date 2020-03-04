class BackgroundFacade

  attr_reader :id, :image_url

  def initialize(location)
    @id = nil
    @location = location
    @image_url = image_url
  end

  def image_url
    UnsplashService.new(@location).get_image
  end

end
