class MessagesController < ApplicationController
   before_filter :authenticate_student!
   def index
    
    @messages=Message.paginate(page: params[:page], per_page: 15) 
   
    respond_to do |format|
      format.html
      format.json{ render json: @messages}
  end

end
 def show

    @message=Message.find(params[:id])
    
    
    respond_to do |format|
      format.html
      format.json {render json: @message}
  end
end
  def create
    puts "in create"
    @message = Message.new(params[:message])
    @message.student_id=current_student.id 
    logger.info  "message is #{params[:message].inspect}"
    @message.save!
  	
    respond_to do |format|
      if @message.id.nil?
        format.html { render action: "new" }
        format.js
      else
        format.html { redirect_to @message , notice: 'message was successfully created.' }
        format.js
       end
      
    end
  end
  def edit
  @message = Message.find(params[:id])
  
  @message.save!
end
def new
  @message = Message.new
  respond_to |format|
  format.html
  format.json { render json: @message}

end
def destroy 
	@message=Message.find(params[:id])
	@message.destroy
	redirect_to messages_path
	end

end
