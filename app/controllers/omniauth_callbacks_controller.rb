class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    raise request.env['omniauth.auth'].to_json
  end
  alias_method :facebook, :all
end
