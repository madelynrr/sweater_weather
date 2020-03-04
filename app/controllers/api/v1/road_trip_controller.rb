class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params[:origin]
    destination = params[:destination]

    road_trip_facade = RoadTripFacade.new(origin, destination)

    render json: RoadTripSerializer.new(road_trip_facade)
  end

end
