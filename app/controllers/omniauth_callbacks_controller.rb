require 'debugger'

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # request.to_json    
    debugger
    # raise request.env['omniauth.auth'].to_json
    user_fb_data = request.env['omniauth.auth']

    @form_data = {}
    @form_data['name'] = user_fb_data['info']['name']
    @form_data['email'] = user_fb_data['info']['email']
    @form_data['username'] = user_fb_data['info']['nickname']
    @form_data['image_path'] = user_fb_data['info']['image']
    @form_data['fb_id'] = user_fb_data[:uid]
    @form_data['fb_token'] = user_fb_data.credentials.token

    session["devise.facebook_data"] = @form_data
    # debugger
    redirect_to step2_path
  end

  alias_method :facebook, :all
end
