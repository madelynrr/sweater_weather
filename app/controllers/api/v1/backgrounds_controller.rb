class Api::V1::BackgroundsController < ApplicationController

  def index
    location = params[:location].split(',').first

    background = BackgroundFacade.new(location)
    render json: BackgroundSerializer.new(background)
  end
end
