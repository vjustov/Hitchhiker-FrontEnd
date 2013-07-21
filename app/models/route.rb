class Route
  include Her::Model

  has_one :schedule
  has_one :vehicle
  belongs_to :hitchhiker
  
  #def build_route params
  #  params.reject { |k,v|}
  #  self.new params
  #end
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
  # include Mongoid::Document
  include Her::Model
  
  has_many :routes
  has_many :vehicles
end
