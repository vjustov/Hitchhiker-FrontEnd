class DriversController < ApplicationController
  def new
  end

  def create
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
end
