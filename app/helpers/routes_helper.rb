module RoutesHelper
  
  def vehicles_by_user
    @vehicles = []
    @vehicles_id = Hitchhiker.where(email: current_user.email).first().vehicle_ids if user_signed_in?
    @vehicles_id.each do |vehicle_id|
      @vehicles << Vehicle.find(vehicle_id)
    end
    @vehicles
  end
end
