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
    @facebook_data = session['devise.facebook_data']
     render 'devise/registrations/step2'
  end
end
