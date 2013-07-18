require 'rest_client'
class HitchhikersController < ApplicationController
  # GET /hitchhikers
  # GET /hitchhikers.json
  def index
    @hitchhikers = Hitchhiker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hitchhikers }
    end
  end

  # GET /hitchhikers/1
  # GET /hitchhikers/1.json
  def show
    @hitchhiker = Hitchhiker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hitchhiker }
    end
  end

  # GET /hitchhikers/new
  # GET /hitchhikers/new.json
  def new
    @hitchhiker = Hitchhiker.new
    @brands = JSON.parse(RestClient.get(ENV['API_URL'] + 'vehicles/brands'))
    @models = []
    @years =[]
    @vehicles = []
    #@data.each do |d|

    #  @brands.merge!d.to_hash
    #end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hitchhiker }
    end
  end

  def add_vehicles
    @vehicles = []

    vehicle = Vehicle.new()
    vehicle.brand = params[:brand]
    vehicle.model = params[:model]
    vehicle.year = params[:year]
    vehicle.sits = params[:sits]
    vehicle.has_trunk = (params[:has_trunk] == 'on')
    @vehicles << vehicle
    p vehicle
    p @vehicles
    #unless params[:brand].nil?
    #  @models = JSON.parse(RestClient.get(ENV['API_URL'] + "vehicles/#{params[:brand]}/models"))
    #end
    respond_to do |format|
      format.js
    end
  end

  def update_models
    @models = []
    unless params[:brand].nil?
      @models = JSON.parse(RestClient.get(ENV['API_URL'] + "vehicles/#{params[:brand]}/models"))
    end
    respond_to do |format|
      format.js
    end
  end

  def update_years
    @years = []
    unless params[:brand].nil? || params[:model].nil?
      @years = JSON.parse(RestClient.get(ENV['API_URL'] + "vehicles/#{params[:brand]}/#{params[:model]}/years"))
      #p @years.collect!
      #p @years[0]['year']
      @years = @years.map{|s| [s['year'], s['id']]}
    end
    respond_to do |format|
      format.js
    end
  end


  def remove_vehicles
    unless params[:brand].nil?
      @vehicles.delete_if { |a| a.id == params[:id] }
    end
    respond_to do |format|
      format.js
    end
  end


  # GET /hitchhikers/1/edit
  def edit
    @hitchhiker = Hitchhiker.find(params[:id])
  end

  # POST /hitchhikers
  # POST /hitchhikers.json
  def create
    @hitchhiker = Hitchhiker.new(params)
    @hitchhiker.vehicles.build(model: params[:model])
    p @hitchhiker
    #@hitchhiker.vehicles << @vehicles
    respond_to do |format|
      if @hitchhiker.save
        format.html { redirect_to @hitchhiker, notice: 'Hitchhiker was successfully created.' }
        format.json { render json: @hitchhiker, status: :created, location: @hitchhiker }
      else
        format.html { render action: "new" }
        format.json { render json: @hitchhiker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hitchhikers/1
  # PUT /hitchhikers/1.json
  def update
    @hitchhiker = Hitchhiker.find(params[:id])

    respond_to do |format|
      if @hitchhiker.update_attributes(params[:hitchhiker])
        format.html { redirect_to @hitchhiker, notice: 'Hitchhiker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hitchhiker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hitchhikers/1
  # DELETE /hitchhikers/1.json
  def destroy
    @hitchhiker = Hitchhiker.find(params[:id])
    @hitchhiker.destroy

    respond_to do |format|
      format.html { redirect_to hitchhikers_url }
      format.json { head :no_content }
    end
  end
end
