class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :weather_icon, :current_summary, :current_temperature, :city_state, :country, :time

end
