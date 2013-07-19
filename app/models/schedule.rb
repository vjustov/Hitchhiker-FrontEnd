class Schedule
  # include Mongoid::Document
  include Her::Model
  
  collection_path "routes/:route_id/schedule"
end


