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
end
