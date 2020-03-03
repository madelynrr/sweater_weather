require 'rails_helper'

RSpec.describe "Weather API" do
  it "returns current weather forecast for given location", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']

    expect(response).to be_successful
    expect(forecast.key?('id')).to be(true)
    expect(forecast.key?('current_forecast')).to be(true)

    expect(forecast['current_forecast'].key?('weather_icon')).to be(true)
    expect(forecast['current_forecast'].key?('current_summary')).to be(true)
    expect(forecast['current_forecast'].key?('current_temperature')).to eq(true)
    expect(forecast['current_forecast'].key?('high_temperature')).to eq(true)
    expect(forecast['current_forecast'].key?('low_temperature')).to eq(true)
    expect(forecast['current_forecast'].key?('city_state')).to eq(true)
    expect(forecast['current_forecast'].key?('country')).to eq(true)
    expect(forecast['current_forecast'].key?('time_date')).to eq(true)
    expect(forecast['current_forecast'].key?('today_forecast')).to eq(true)
    expect(forecast['current_forecast'].key?('tonight_forecast')).to eq(true)
    expect(forecast['current_forecast'].key?('feels_like')).to eq(true)
    expect(forecast['current_forecast'].key?('humidity')).to eq(true)
    expect(forecast['current_forecast'].key?('visibility')).to eq(true)
    expect(forecast['current_forecast'].key?('uv_index')).to eq(true)

    # expect(forecast['current_forecast'].key?('five_day_forecast')).to eq(true)
    # expect(forecast['current_forecast']['five_day_forecast'].count).to eq(5)
    # expect(forecast['current_forecast']['five_day_forecast'].first.key?('icon')).to eq(true)
    # expect(forecast['current_forecast']['five_day_forecast'].first.key?('summary')).to eq(true)
    # expect(forecast['current_forecast']['five_day_forecast'].first.key?('precipProbability')).to eq(true)
    # expect(forecast['current_forecast']['five_day_forecast'].first.key?('temperatureHigh')).to eq(true)
    # expect(forecast['current_forecast']['five_day_forecast'].first.key?('temperatureLow')).to eq(true)
  end

  it "returns temperature for next eight hours", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']

    expect(response).to be_successful
    expect(forecast.key?('id')).to be(true)
    expect(forecast.key?('hourly_forecast')).to be(true)

    hourly_forecast = forecast["hourly_forecast"]
    expect(hourly_forecast.key?('eight_hours')).to be(true)
    expect(hourly_forecast['eight_hours'].class).to eq(Array)
    expect(hourly_forecast['eight_hours'].length).to eq(8)
    expect(hourly_forecast['eight_hours'][0].key?('time_0')).to be(true)
    expect(hourly_forecast['eight_hours'][0].key?('temperature_0')).to be(true)
  end

  it "returns forecast for next five days", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']

    expect(response).to be_successful
    expect(forecast.key?('id')).to be(true)
    expect(forecast.key?('daily_forecast')).to be(true)

    daily_forecast = forecast["daily_forecast"]
    expect(daily_forecast.key?('five_days')).to be(true)
    expect(daily_forecast['five_days'].class).to eq(Array)
    expect(daily_forecast['five_days'].length).to eq(5)
    expect(daily_forecast['five_days'][0].key?('date_0')).to be(true)
    expect(daily_forecast['five_days'][0].key?('icon_0')).to be(true)
    expect(daily_forecast['five_days'][0].key?('summary_0')).to be(true)
    expect(daily_forecast['five_days'][0].key?('precipitation_percentage_0')).to be(true)
    expect(daily_forecast['five_days'][0].key?('high_temperature_0')).to be(true)
    expect(daily_forecast['five_days'][0].key?('low_temperature_0')).to be(true)
  end

end
