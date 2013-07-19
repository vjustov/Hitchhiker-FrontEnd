class Route
  # include Mongoid::Document
  include Her::Model

  has_one :schedule
  has_one :vehicle
  belongs_to :hitchhiker
end

