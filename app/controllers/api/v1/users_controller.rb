class Api::V1::UsersController < ApplicationController

  def create
    if user = User.create!(user_params)
      response.status = 201
      render json: UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
