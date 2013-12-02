class EventsController < ApplicationController
	 before_filter :authenticate_student!
   before_filter :only_allow_social_chair, :only => [:create]
   def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    puts "in create"
    @event = Event.new(params[:event])
    logger.info "house id is #{params[:event][:house_id].inspect}"
    @event.houses << House.find(params[:event][:house_id])
    @event.host_id=@event.house_id
    @event.save!
  	
    respond_to do |format|
      if @event.id.nil?
        format.html { render action: "new" }
        format.js
      else
         format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.js
       end
      
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event.houses << House.find(params[:event][:house_id])
    @event.save!
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
private 
def only_allow_social_chair
  redirect_to root_path, :alert => 'Not authorized as a social chair.' unless current_student.has_role? :social_chair
end

end
