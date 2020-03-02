require 'rails_helper'

RSpec.describe "Sweater Weather API" do
  it "returns open restaurant and future forecast for endpoint of trip", :vcr do
    WebMock.allow_net_connect!
    VCR.eject_cassette
    VCR.turn_off!

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful
    information = JSON.parse(response.body)


    expect(information.key?('data')).to be(true)
    expect(information['data']['attributes'].key?('id')).to be(true)
    expect(information['data'].key?('type')).to be(true)
    expect(information['data'].key?('attributes')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('end_location')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('travel_time')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('forecast')).to be(true)

    expect(information['data']['attributes']['munchies_return'].key?('type')).to be(true)
    # expect(information['data']['restaurant'].key?('name')).to be(true)
    # expect(information['data']['restaurant'].key?('address')).to be(true)



    # Response Format:
    # {
    #   "data": {
    #     "id": "null",
    #     "type": "munchie",
    #     "attributes": {
    #       "end_location": "Pueblo, CO",
    #       "travel_time": "1 hours 48 min",
    #       "forecast": "Cloudy with a chance of meatballs"
    #       "restaurant": {
    #         "name": "Chinese Restaurant",
    #         "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
    #       }
    #     }
    #   }
    # }



  end
end

# Munchies Endpoint
# ## Request
# `GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese`
# ## Description
# This endpoint will retrieve food and forecast information for a destination city.
# You will use the Google Directions API in order to find out how long it will take to travel from Denver, CO to Pueblo, CO. Then using the Yelp API, you will find a restaurant serving that type cuisine that WILL BE OPEN at your estimated time of arrival. Using the Darksky API you will find the current weather forecast at your time of arrival.
# Your API will return:
# - the end city
# - estimated travel time
# - the name and address of a restaurant with a specified cuisine
# - the forecast at your time of arrival
# ## Response Format
# {
#   "data": {
#     "id": "null",
#     "type": "munchie",
#     "attributes": {
#       "end_location": "Pueblo, CO",
#       "travel_time": "1 hours 48 min",
#       "forecast": "Cloudy with a chance of meatballs"
#       "restaurant": {
#         "name": "Chinese Restaurant",
#         "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
#       }
#     }
#   }
# }
# API's you will use:
# 1. Google directions API
#   - to find out how long it will take to travel from your start location to your end location.
#   - https://developers.google.com/maps/documentation/directions/start
# 1. Yelp Fusion API
#   - to find the name and address a restaurant in your end location that will be open at the time of arrival.
#   - https://www.yelp.com/developers/documentation/v3/business_search
# 1. Darksky API
#   - to find the forecast in the end location at the time of arrival.
#   - https://darksky.net/dev/docs#time-machine-request
# Technical notes:
# The Yelp API only accepts time as UNIX time. You can convert a Time object into UNIX time by doing something like this: `Time.now.to_i`
# You can find out time in the future using a feature built into Rails' ActiveSupport which will let you do things like this: Time.now + 4.hours (This will ONLY work in Rails and not a pry session run from the command line)
