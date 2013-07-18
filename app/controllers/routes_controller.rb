class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.all
    @hitchhikers = Hitchhiker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
    end
  end

  def check_in
    debugger
    @route = Route.find(params[:id])
    @Hitchhiker = Hitchhiker.find(params[:user_id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to @route, notice: 'Check in succesfull, Have a nice ride.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = Route.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    #debugger
    @route = Route.find(params[:id])
    
  end

  # POST /routes
  # POST /routes.json
  def create
    if user_signed_in?
      user = Hitchhiker.where(:email => current_user.email)
      @route = Route.new(params[:route])
      routeInfo = JSON.parse(params[:route_map_points].gsub("jb","latitude").gsub("kb","longitude"))
      debugger
      
      @route.route_points = routeInfo['overview_path']
      @route.starting_point = routeInfo['overview_path'].first
      @route.end_point = routeInfo['overview_path'].last
      @route.hitchhiker_id = user.first()["_id"]
      
  
      respond_to do |format|
        if @route.save
          if  @route.schedule.create( _route_id: @route._id,
                                   departure: params[:route_schedule_departure], 
                                   arrival: params[:route_schedule_arrival])
            format.html { redirect_to @route, notice: 'Route was successfully created.' }
            format.json { render json: @route, status: :created, location: @route }
          else
            format.html { render action: "new" }
            format.json { render json: @route.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    @route = Route.find(params[:id])
    if user_signed_in?
      routeInfo = JSON.parse(params[:route_map_points].gsub("jb","latitude").gsub("kb","longitude"))
      debugger
      
      @route.route_points = routeInfo['overview_path']
      @route.starting_point = routeInfo['overview_path'].first
      @route.end_point = routeInfo['overview_path'].last


      respond_to do |format|
        if @route.save(params[:route])
          if @route.schedule.update_attributes(
                                                 departure: params[:route_schedule_departure], 
                                                 arrival: params[:route_schedule_arrival])  
            format.html { redirect_to @route, notice: 'Route was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @route.errors, status: :unprocessable_entity }
          end
       end
   end
end
  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end
end
end
