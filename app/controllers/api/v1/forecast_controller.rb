class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]

    conn = Faraday.get(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.params = {
        key: ENV['GOOGLE_GEOCODING_API_KEY'],
        address: location
      }
    end
require "pry"; binding.pry
  end

end
