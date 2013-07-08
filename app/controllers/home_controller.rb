class HomeController < ApplicationController
  def index
    @routes = routes.all
  end
end
