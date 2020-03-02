require 'rails_helper'

RSpec.describe "Weather API" do
  xit "can retrieve lat and long with given city and state", :vcr do
    # VCR.use_cassette('denver_lat_long') do

      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      lat_and_long = JSON.parse(response.body)
      expect(lat_and_long['lat']).to eq(39.7392358)
      expect(lat_and_long['lng']).to eq(-104.990251)
  end

  it "returns current weather forecast for given location", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']


    expect(response).to be_successful
    expect(forecast.key?('id')).to be(true)
    expect(forecast.key?('daily_forecast')).to be(true)



    expect(forecast['daily_forecast'].key?('weather_icon')).to be(true)
    expect(forecast['daily_forecast'].key?('current_summary')).to be(true)
    expect(forecast['daily_forecast'].key?('current_temperature')).to eq(true)
    expect(forecast['daily_forecast'].key?('high_temperature')).to eq(true)
    expect(forecast['daily_forecast'].key?('low_temperature')).to eq(true)
    expect(forecast['daily_forecast'].key?('city_state')).to eq(true)
    expect(forecast['daily_forecast'].key?('country')).to eq(true)
    expect(forecast['daily_forecast'].key?('time')).to eq(true)
    # expect(forecast['daily_forecast'].key?('date')).to eq(true)
    expect(forecast['daily_forecast'].key?('today_forecast')).to eq(true)
    expect(forecast['daily_forecast'].key?('tonight_forecast')).to eq(true)
    expect(forecast['daily_forecast'].key?('feels_like')).to eq(true)
    expect(forecast['daily_forecast'].key?('humidity')).to eq(true)
    expect(forecast['daily_forecast'].key?('visibility')).to eq(true)
    expect(forecast['daily_forecast'].key?('uv_index')).to eq(true)

    expect(forecast['daily_forecast'].key?('eight_hour_temperatures')).to eq(true)
    expect(forecast['daily_forecast']['eight_hour_temperatures'].count).to eq(8)
    expect(forecast['daily_forecast']['eight_hour_temperatures'].first.key?('time')).to eq(true)
    expect(forecast['daily_forecast']['eight_hour_temperatures'].first.key?('temperature')).to eq(true)

    expect(forecast['daily_forecast'].key?('five_day_forecast')).to eq(true)
    expect(forecast['daily_forecast']['five_day_forecast'].count).to eq(5)
    expect(forecast['daily_forecast']['five_day_forecast'].first.key?('icon')).to eq(true)
    expect(forecast['daily_forecast']['five_day_forecast'].first.key?('summary')).to eq(true)
    expect(forecast['daily_forecast']['five_day_forecast'].first.key?('precipProbability')).to eq(true)
    expect(forecast['daily_forecast']['five_day_forecast'].first.key?('temperatureHigh')).to eq(true)
    expect(forecast['daily_forecast']['five_day_forecast'].first.key?('temperatureLow')).to eq(true)
  end

  xit "returns hourly weather forecast for given city", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']
  end
end
