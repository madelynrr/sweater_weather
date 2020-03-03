require 'rails_helper'

RSpec.describe "Geocoding Service" do
  it "returns lat by given city", :vcr do
    location = "denver,co"
    lat_long_search = GeocodingService.new(location).get_lat_long

    parsed_response = JSON.parse(lat_long_search.body)

    expect(parsed_response).to be_a Hash
    expect(parsed_response['results']).to be_an Array
    expect(parsed_response['results'].first.key?('geometry')).to be(true)
    expect(parsed_response['results'].first['geometry']['location'].key?('lat')).to be(true)
    expect(parsed_response['results'].first['geometry']['location'].key?('lng')).to be(true)
    expect(parsed_response['results'].first['address_components'][3].key?('long_name')).to be(true)
  end
end
