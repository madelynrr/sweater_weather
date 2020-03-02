require 'rails_helper'

RSpec.describe "Sweater Weather API" do
  it "returns open restaurant and future forecast for endpoint of trip", :vcr do
    # WebMock.allow_net_connect!
    # VCR.eject_cassette
    # VCR.turn_off!

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
    expect(information['data']['attributes']['munchies_return'].key?('attributes')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('end_location')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('travel_time')).to be(true)
    expect(information['data']['attributes']['munchies_return']['attributes'].key?('forecast')).to be(true)

    expect(information['data']['attributes']['munchies_return'].key?('restaurant')).to be(true)
    expect(information['data']['attributes']['munchies_return']['restaurant'].key?('name')).to be(true)
    expect(information['data']['attributes']['munchies_return']['restaurant'].key?('address')).to be(true)


    # expect(information['data']['restaurant'].key?('name')).to be(true)
    # expect(information['data']['restaurant'].key?('address')).to be(true)
  end
end
