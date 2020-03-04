require 'rails_helper'

RSpec.describe "Weather API" do
  it "can return travel time and weather forecast for a road trip given an api key" do
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
    expect(parsed_response['data'].key?('type')).to eq("road_trip")
    expect(parsed_response['data']['attributes'].key?('id')).to be(true)
    expect(parsed_response['data']['attributes'].key?('origin')).to be(true)
    expect(parsed_response['data']['attributes'].key?('destination')).to be(true)
    expect(parsed_response['data']['attributes'].key?('travel_time')).to be(true)
    expect(parsed_response['data']['attributes'].key?('travel_time')).to be(true)
    expect(parsed_response['data']['attributes'].key?('icon')).to be(true)
    expect(parsed_response['data']['attributes'].key?('temperature')).to be(true)
  end
end
