require 'debugger'

class RegistrationsController < Devise::RegistrationsController
#  def sign_up(resource_name, resource)
#  	debugger
#   sign_in(resource_name, resource)
# end

  def create
    debugger
    build_resource(sign_up_params)
    hitchhiker_data = {username: sign_up_params['username'], email: sign_up_params['email'] }
    hitchhiker = Hitchhiker.new Hitchhiker_data
    
    if resource.save && hitchhiker.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def after_sign_up_path_for resource
    routes_path
  end
end
