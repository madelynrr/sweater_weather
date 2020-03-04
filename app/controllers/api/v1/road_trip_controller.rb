class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: params[:api_key])
      origin = params[:origin]
      destination = params[:destination]

      road_trip_facade = RoadTripFacade.new(origin, destination)

      render json: RoadTripSerializer.new(road_trip_facade)
    else
      response.status = 401
      render json: {
                    "error": "API Key Required"
                    }
    end
  end

end
