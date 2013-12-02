class InvitationsController < ApplicationController
before_filter :authenticate_student!
def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitation }
    end
  end
   def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitation }
    end
  end
  def edit
    @invitation = Invitation.find(params[:id])
  end
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation }
    end
  end

def create
    puts "in create"
   
    @invitation = Invitation.new(params[:invitation])
    logger.info "house id is #{params[:invitation][:house_id].inspect}"
    @invitation.house_id=params[:invitation][:house_id]
    @invitation.event_id=params[:invitation][:event_id]
    unless Invitation.where(:house_id => params[:invitation][:house_id], :event_id => params[:invitation][:event_id]) then
    @invitation.save!
  	end
    respond_to do |format|
      if @invitation.id.nil?
        format.html { render action: "new" }
        format.js
      else
         format.html { redirect_to @invitation, notice: 'invitation was successfully created.' }
        format.json
  
      end
    end
  end
  def update
    @invitation = Invitation.find(params[:id])
  
    respond_to do |format|
    
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, notice: 'invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
          if(@invitation.response=="Yes") then
    @invitation.event.houses << House.find(@invitation.house_id)
end
if(@invitation.response=="No") then
  @invitation.event.houses.delete(House.find(@invitation.house_id))
end
    end
  end
def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end
  def attending
    @invitation = Invitation.find(params[:id])
    current_student.up_vote(@invitation)
    redirect_to :back
end
def not_attending
  @invitation = Invitation.find(params[:id])
    current_student.down_vote(@invitation)
    redirect_to :back
  end
end
