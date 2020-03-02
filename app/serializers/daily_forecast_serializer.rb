class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :weather_icon, :current_summary, :current_temperature, :city_state, :country, :time, :today_forecast, :tonight_forecast, :feels_like, :humidity, :visibility, :uv_index, :eight_hour_temperatures

  # :high_temperature, :low_temperature, :date

end
