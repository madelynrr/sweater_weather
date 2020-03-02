class YelpService

  def initialize(lat, long, category, arrival_time)
    @lat = lat
    @long = long
    @category = category
    @arrival_time = arrival_time
  end

  def return_restaurant
    Faraday.get('https://api.yelp.com/v3/businesses/search?&open_at') do |req|
      req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      req.params['term'] = 'restaurants'
      req.params['latitude'] = @lat
      req.params['longitude'] = @long
      req.params['categories'] = @category
      req.params['open_at'] = @arrival_time
    end
  end





end
