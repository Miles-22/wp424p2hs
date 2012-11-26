
# Add method and link in show view to list all of the assignments for a course
# Then in show view for assignment add link to list for each of the questions on the assignment.
# Only update the submission table once the student has submitted the assignment might need to change
# assignment question relation design.

# Once the assignment is submitted instructor will have access to that data in the grades table.
class EnrollmentsController < ApplicationController
  # GET /enrollments
  # GET /enrollments.json
  def index
	
    @enrollments = Enrollment.where(:user_number => session[:user_id].to_s)
	#@teaching_courses = a = TeachingCourse.where(:instructor => session[:user_id].to_s)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enrollments }
    end
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    @enrollment = Enrollment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enrollment }
    end
  end

  # GET /enrollments/new
  # GET /enrollments/new.json
  def new
    @enrollment = Enrollment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enrollment }
    end
  end

  # GET /enrollments/1/edit
  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
  
	# create a new student as well if there is not already a student associated with this user.
	#Student.new({:user_id => session[:id], :student_number => params[:enrollment][:student_number]})
	
	# give correct user id.
	params[:enrollment][:user_number] = session[:user_id]
    @enrollment = Enrollment.new(params[:enrollment])
	
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render json: @enrollment, status: :created, location: @enrollment }
      else
        format.html { render action: "new" }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enrollments/1
  # PUT /enrollments/1.json
  def update
  
    @enrollment = Enrollment.find(params[:id])
	# give correct user id.
	
    respond_to do |format|
      if @enrollment.update_attributes(params[:enrollment])
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url }
      format.json { head :no_content }
    end
  end
end
