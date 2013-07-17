class Hitchhiker
  include Her::Model
  include Mongoid::Document

  attributes :username, :name, :password, :lastname, :hitchhiker, :email
  has_many :vehicles
end
