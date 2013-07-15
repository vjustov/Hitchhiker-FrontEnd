class Route
  include Mongoid::Document
  include Her::Model

 # embeds_one :schedule
end

class Schedule
  include Mongoid::Document
  include Her::Model
  
  #embedded_in :route
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