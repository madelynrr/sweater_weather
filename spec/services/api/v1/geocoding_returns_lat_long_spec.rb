require 'rails_helper'

RSpec.describe "Geocoding Service" do
  it "returns lat by given city" do
    location = "denver,co"
    service = GeocodingService.new(location)
    lat = service.location_lat

    expect(lat).to eq(39.7392358)
  end
end
