require 'rails_helper'

RSpec.describe "Weather API" do
  it "can retrieve lat and long with given city and state" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    lat = JSON.parse(response.body)

  end
end
