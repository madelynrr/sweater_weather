class UnsplashService

  def initialize(location)
    @location = location
  end

  def get_image
    response = Faraday.get("https://api.unsplash.com/search/photos") do |req|
      req.params['client_id'] = "#{ENV['UNSPLASH_API_KEY']}"
      req.params['query'] = @location
    end
    JSON.parse(response.body)['results'].first['urls']['raw']
  end

end
