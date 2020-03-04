require 'rails_helper'

RSpec.describe "Weather API" do
  it "a registered user can log in with their email and password and the response will contain their api key" do
    user = User.create(email: "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
                )
    params = {
              "email": "whatever@example.com",
              "password": "password"
              }
    post "/api/v1/sessions", params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(session[:user_id]).to eq(user.id)

    parsed_response = JSON.parse(response.body)

    expect(parsed_response['data']['attributes'].key?('api_key')).to be(true)
  end

  it "returns vague error message if user login unsuccessful" do
    user = User.create(email: "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
                )
    params = {
              "email": "whatever@example.com",
              "password": "prisonmike"
              }
    post "/api/v1/sessions", params: params

    parsed_response = JSON.parse(response.body)
    require "pry"; binding.pry
  end
end
