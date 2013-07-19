class Hitchhiker
  include Her::Model

  scope :find_by, ->(key, value){ where(key.to_sym => value).first}

  has_many :vehicles


end
