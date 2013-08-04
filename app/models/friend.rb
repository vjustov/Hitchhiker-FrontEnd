class Friend
  include Mongoid::Document

  attr_accessor :id_1, :id_2

  field :id_1, type: String
  field :id_2, type: String

  has_and_belongs_to_many :hitchhikers
end
