require 'rails_helper'

RSpec.describe "Weather API creates a user" do
  it "creates a user and stores it in the database and returns a unique API key" do
    user_params = {
                    "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password"
                  }
    post '/api/v1/users', params: {user: user_params}

    user = User.last

    expect(user.email).to eq(user_params['email'])
    expect(user.api_key?).to be(true)

    expect(response).to be_successful
    expect(response.body.key?('api_key')).to be(true)
  end
end
