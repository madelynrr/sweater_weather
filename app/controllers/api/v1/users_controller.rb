class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      response.status = 201
      render json: UserSerializer.new(User.last)
    else
      response.status = 400
      # errors = user.errors.full_messages.to_sentence
      render json: ErrorSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
