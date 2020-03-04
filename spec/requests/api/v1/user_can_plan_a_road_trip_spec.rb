require 'rails_helper'

RSpec.describe "Weather API" do
  it "can return travel time and weather forecast for a road trip given an api key", :vcr do
    VCR.eject_cassette
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!

    user = User.create(email: "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
                )

    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "#{user.api_key}"
              }

    post "/api/v1/road_trip", params: params

    parsed_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(parsed_response['data'].key?('type')).to be(true)
    expect(parsed_response['data']['type']).to eq("road_trip")
    expect(parsed_response['data']['attributes'].key?('road_trip')).to be(true)
    expect(parsed_response['data']['attributes'].key?('travel_forecast')).to be(true)
    expect(parsed_response['data']['attributes']['road_trip'].key?('origin')).to be(true)
    expect(parsed_response['data']['attributes']['road_trip'].key?('destination')).to be(true)
    expect(parsed_response['data']['attributes']['road_trip'].key?('travel_time_text')).to be(true)
    expect(parsed_response['data']['attributes']['travel_forecast'].key?('summary')).to be(true)
    expect(parsed_response['data']['attributes']['travel_forecast'].key?('temperature')).to be(true)
  end

  it "returns error message if user's api key is not present", :vcr do
    VCR.eject_cassette
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!

    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              }

    post "/api/v1/road_trip", params: params

    parsed_response = JSON.parse(response.body)

    expect(response.status).to eq(401)
    expect(parsed_response['error']).to eq("API Key Required")
  end
end
