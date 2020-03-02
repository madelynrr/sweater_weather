class DailyForecast

  attr_reader :id, :weather_icon, :current_summary, :current_temperature, :high_temperature, :low_temperature, :city_state, :country, :time, :today_forecast, :tonight_forecast, :feels_like, :humidity, :visibility, :uv_index, :eight_hour_temperatures, :five_day_forecast
  # :high_temperature, :low_temperature, :date

  def initialize(attributes, location, country)
    @id = nil
    @attributes = attributes
    @weather_icon = attributes['currently']['icon']
    @current_summary = attributes['currently']['summary']
    @current_temperature = attributes['currently']['temperature']
    @high_temperature = attributes['daily']['data'].first['temperatureHigh']
    @low_temperature = attributes['daily']['data'].first['temperatureLow']
    @city_state = location
    @country = country
    @time = attributes['currently']['time']
    # @date = attributes
    @today_forecast = attributes['daily']['summary']
    @tonight_forecast = attributes['daily']['data'].first['summary']
    @feels_like = attributes['currently']['apparentTemperature']
    @humidity = attributes['currently']['humidity']
    @visibility = attributes['currently']['visibility']
    @uv_index = attributes['currently']['uvIndex']
    @eight_hour_temperatures = attributes['hourly']['data'][0..7]

    @five_day_forecast = attributes['daily']['data'][0..4]
  end

  # def temperatures_array
  #   @attributes['hourly']['data'][0..7].each do |information|
  #     red['time'] = information['time']
  #     red['temperature'] = information['temperature']
  #   end
  # end

end
