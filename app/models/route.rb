class Route
  include Mongoid::Document
  include Her::Model

  has_one :schedule
  has_one :vehicle
end

class Schedule
  include Mongoid::Document
  include Her::Model
  
  collection_path "routes/:route_id/schedule"
end


class Vehicle
  include Mongoid::Document
  include Her::Model
  
end

class Hitchhiker
  include Mongoid::Document
  include Her::Model
  
  has_many :vehicles
end
