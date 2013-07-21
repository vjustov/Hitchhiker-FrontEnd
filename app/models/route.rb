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

