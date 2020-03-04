require 'rails_helper'

RSpec.describe "Weather API Homepage" do
  it "returns url by give city and state", :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    parsed_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed_response['data']['attributes'].key?('image_url')).to eq(true)
  end
end
