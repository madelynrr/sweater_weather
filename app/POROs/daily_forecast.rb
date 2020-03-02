class DailyForecast

  attr_reader :id, :weather_icon, :current_summary, :current_temperature, :city_state, :country, :time

  def initialize(attributes, location, country)
    @id = nil
    @weather_icon = attributes['currently']['icon']
    @current_summary = attributes['currently']['summary']
    @current_temperature = attributes['currently']['temperature']
    # @high_temperature = attributes
    # @low_temperature = attributes
    @city_state = location
    @country = country
    @time = attributes['currently']['time']




  end

end
