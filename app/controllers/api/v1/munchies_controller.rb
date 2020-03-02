class Api::V1::MunchiesController < ApplicationController

  def index
    start_point = params[:start]
    end_point = params[:end]

    duration_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params['key'] = ENV['GOOGLE_DIRECTIONS_API_KEY']
      req.params['origin'] = start_point
      req.params['destination'] = end_point

  end
    require "pry"; binding.pry
  end

end
