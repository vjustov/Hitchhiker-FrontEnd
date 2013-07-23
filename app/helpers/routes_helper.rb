module RoutesHelper
  
  def vehicles_by_user
    @vehicles = []
    hitchhiker = Hitchhiker.find_by('email', current_user.email)
    unless hitchhiker.nil?
      @vehicles_id = hitchhiker.vehicle_ids if user_signed_in?
      @vehicles_id.each do |vehicle_id|
        @vehicles << Vehicle.find(vehicle_id)
      end
    end
    @vehicles
  end
end
