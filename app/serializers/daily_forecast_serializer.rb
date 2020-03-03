class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :current_forecast, :hourly_forecast
  # :weather_icon, :current_summary, :current_temperature, :high_temperature, :low_temperature, :city_state, :country, :time, :today_forecast, :tonight_forecast, :feels_like, :humidity, :visibility, :uv_index, :eight_hour_temperatures, :five_day_forecast

  # :high_temperature, :low_temperature, :date

end
