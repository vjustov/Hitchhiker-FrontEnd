require 'debugger'

class RegistrationsController < Devise::RegistrationsController
#  def sign_up(resource_name, resource)
#  	debugger
#   sign_in(resource_name, resource)
# end

  def create
    debugger
    build_resource(sign_up_params)

    # resource.fb_id = sign_up_params['fb_id']
    # resource.fb_token = sign_up_params['fb_token']

    hitchhiker_data = {username: sign_up_params['username'], email: sign_up_params['email'] }
    hitchhiker = Hitchhiker.new hitchhiker_data
    



    if resource.save && hitchhiker.save # Todo: Check and rollback in the case that one of the resources/hitchhikers does not save, but the other one does.
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(hitchhiker)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(hitchhiker)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def after_sign_up_path_for resource
    # debugger
    edit_hitchhiker_path(resource._id)
  end

end
