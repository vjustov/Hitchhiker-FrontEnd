class Route
  include Mongoid::Document
  include Her::Model

  has_one :schedule
  has_one :vehicle
  belongs_to :hitchhiker
end

class Schedule
  include Mongoid::Document
  include Her::Model
  
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
  #include Her::Model
  #attributes:id,
  #:active, 
  #:available_sits, 
  #:city,
  #:country,
  #:end_point,
  #:passengers,
  #:route_link,
  #:route_points,
  #:starting_point, 
  #:user_id,
  #:vehicle_id