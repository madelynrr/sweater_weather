class Api::V1::RoadTripController < ApplicationController

  def create
    origin = params[:origin]
    destination = params[:destination]

    duration_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['key'] = ENV['GOOGLE_DIRECTIONS_API_KEY']
      req.params['origin'] = origin
      req.params['destination'] = destination
  end



  end

end
