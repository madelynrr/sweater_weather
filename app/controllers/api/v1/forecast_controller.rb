class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]

    response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |req|
      req.params['key'] = ENV['GOOGLE_GEOCODING_API_KEY']
      req.params['address'] = location
    end

    lat_and_long = JSON.parse(response.body)['results'].first['geometry']['location']
    render json: lat_and_long
  end

end
