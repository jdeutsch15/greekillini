class StudentsController < ApplicationController
  before_filter :authenticate_student!
  before_filter :only_allow_admin, :only => [:index]
  def index
  	
  	@students=Student.search(params[:search])
  	respond_to do |format|
  		format.html
  		format.json{ render json: @students}
  end

end
 def show
if params[:id].nil? 
    @student = current_student
else 
    @student = Student.find params[:id]
end
  	
  	@messages=@student.messages.paginate(page: params[:page])
  	
  	respond_to do |format|
  		format.html
  		format.json {render json: @student}
  end
end
def new
	@student = Student.new
	respond_to |format|
	format.html
	format.json { render json: @student}

end
def edit
	@student = Student.find(params[:id])
	@student.house_id=House.find(params[:student][:house_id])
	@student.save!
end
def create
	@student=Student.create_new(params[:student])
	@student.save!
	@profile=Profile.create_new(params[:profile])
	@profile.student_id=@student.id
	@profile.save!
	respond_to do |format|
		if @student.id.nil?
			format.html {render action: "new"}
			format.json {render json: @studnet.errors, status: :unprocessable_entity}
		else
			format.html {redirect to @studnet, notice: "Student was successfully created."}
			format.json {render json: @student, status: :created, location: @student}
		end
	end
end
def update
	@student=Student.find(params[:id])
	@student.house_id=House.find(params[:student][:house_id])
	logger.info "house id is #{params[:student].inspect}"
	@student.save!
	respond_to do |format|
		if @student.update_attributes(params[:student])
			format.html {redirect_to @student, notice: 'Student was successfully updated.'}
			format.json {head :no_content}
		else
			format.html {render action: "edit"}
			format.json	{render json: @student.errors, status: :unprocessable_entity}
		end
	end
end
def destroy
	@student=Student.find(params[:id])
	@student.destroy
	respond_to do |format|
		format.html {redirect_to :back}
		format.json {head :no_content}
	end
end
private 
def only_allow_admin
	redirect_to houses_path, :alert => 'Not authorized as an administrator.' unless current_student.has_role? :admin
end

end



