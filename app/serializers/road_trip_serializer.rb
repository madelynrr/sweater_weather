class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :road_trip, :travel_forecast
end
