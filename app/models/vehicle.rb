class Vehicle
  # include Mongoid::Document
  include Her::Model

  has_many :routes
  has_many :hitchhikers
end
