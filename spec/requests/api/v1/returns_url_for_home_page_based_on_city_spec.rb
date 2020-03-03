require 'rails_helper'

RSpec.describe "Weather API Homepage" do
  it "returns url by give city and state", :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful


  end
end
