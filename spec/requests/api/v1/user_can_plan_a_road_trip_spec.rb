require 'rails_helper'

RSpec.describe "Weather API" do
  it "can return travel time and weather forecast for a road trip" do
    post "/api/v1/road_trip"
    expect(response).to be_successful

  end
end
