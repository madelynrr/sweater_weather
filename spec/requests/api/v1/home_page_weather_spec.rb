require 'rails_helper'

RSpec.describe "Weather API" do
  it "can retrieve lat and long with given city and state", :vcr do
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
    expect(forecast.key?('weather_icon')).to be(true)
    expect(forecast.key?('current_summary')).to be(true)
    expect(forecast.key?('current_temperature')).to eq(true)
    # expect(forecast.key?('high_temperature')).to eq(true)
    # expect(forecast.key?('low_temperature')).to eq(true)
    expect(forecast.key?('city_state')).to eq(true)
    expect(forecast.key?('country')).to eq(true)
    expect(forecast.key?('time')).to eq(true)
    # expect(forecast.key?('date')).to eq(true)
    expect(forecast.key?('today_forecast')).to eq(true)
    expect(forecast.key?('tonight_forecast')).to eq(true)
    expect(forecast.key?('feels_like')).to eq(true)
    expect(forecast.key?('humidity')).to eq(true)
    expect(forecast.key?('visibility')).to eq(true)
    expect(forecast.key?('uv_index')).to eq(true)
  end

  it "returns hourly weather forecast for given city", :vcr do
    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body)['data']['attributes']

    require "pry"; binding.pry

  end
end
