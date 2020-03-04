require 'rails_helper'

RSpec.describe "Weather API creates a user" do
  it "creates a user and stores it in the database and returns a unique API key" do
    user_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                  }
    post '/api/v1/users', params: user_params

    user = User.last
    expect(response).to be_successful
    expect(user.email).to eq(user_params[:email])
    expect(user.api_key?).to be(true)

    parsed_response = JSON.parse(response.body)
    expect(parsed_response['data']['attributes'].key?('api_key')).to be(true)
  end

  it "returns response status 201 if user is created" do
    user_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                  }
    post '/api/v1/users', params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end


end
