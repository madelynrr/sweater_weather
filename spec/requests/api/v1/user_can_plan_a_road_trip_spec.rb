require 'rails_helper'

RSpec.describe "Weather API" do
  it "can return travel time and weather forecast for a road trip" do
    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": "jgn983hy48thw9begh98h4539h4"
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
