class RouteController < ApplicationController
  # before_filter :authenticate_user!
  
  def index
    @routes = User.all
  end



end
