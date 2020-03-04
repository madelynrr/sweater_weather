require 'rails_helper'

RSpec.describe "Weather API" do
  it "a registered user can log in with their email and password and the response will contain their api key" do
    post "/api/v1/sessions"

    expect(response).to be_successful

  end
end
