class Api::V1::BackgroundsController < ApplicationController

  def index
    Faraday.get('https://api.unsplash.com/search/photos') do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      # req.headers['Accept-Version'] = 'v1'
      req.params['query'] = 'denver'
    end

require "pry"; binding.pry
    x = JSON.parse(response.body)




    render json: BackgroundSerializer.new()







  end

end
