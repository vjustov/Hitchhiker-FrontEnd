class UsersController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def step2
    # debugger

    @brands = []
    Vehicle.all.entries.each {|entry| @brands << {:brand => entry[:brand]}}
    @brands.uniq!
    @facebook_data = session['devise.facebook_data']
     render 'devise/registrations/step2' 
  end
end
