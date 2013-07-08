class RouteController < ApplicationController

  def index
    @routes = User.all
  end

end
