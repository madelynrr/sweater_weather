class Api::V1::BackgroundsController < ApplicationController

  def index
    response = Faraday.get("https://api.unsplash.com/search/photos") do |req|
      req.params['client_id'] = "#{ENV['UNSPLASH_API_KEY']}"
      req.params['query'] = 'denver'
    end

    JSON.parse(response.body)['results'].first['urls']['raw']








  end

end
