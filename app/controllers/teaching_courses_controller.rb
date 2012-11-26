class TeachingCoursesController < ApplicationController
  # GET /teaching_courses
  # GET /teaching_courses.json
  def index
    # @teaching_courses = TeachingCourse.all
	
	@teaching_courses = TeachingCourse.where(:instructor => session[:user_id].to_s)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teaching_courses }
    end
  end

  # GET /teaching_courses/1
  # GET /teaching_courses/1.json
  def show
    @teaching_course = TeachingCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teaching_course }
    end
  end

  # GET /teaching_courses/new
  # GET /teaching_courses/new.json
  def new
    @teaching_course = TeachingCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teaching_course }
    end
  end

  # GET /teaching_courses/1/edit
  def edit
    @teaching_course = TeachingCourse.find(params[:id])
  end

  # POST /teaching_courses
  # POST /teaching_courses.json
  def create
  
	# need to create the course if it's not already there.
	
	params[:teaching_course][:instructor] = session[:user_id]
    @teaching_course = TeachingCourse.new(params[:teaching_course])
	
	print "teaching_course looks like: #{@teaching_course}\n"
	
    respond_to do |format|
      if @teaching_course.save
        format.html { redirect_to @teaching_course, notice: 'Teaching course was successfully created.' }
        format.json { render json: @teaching_course, status: :created, location: @teaching_course }
      else
        format.html { render action: "new" }
        format.json { render json: @teaching_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teaching_courses/1
  # PUT /teaching_courses/1.json
  def update
	
	# need to create the course if it's not already there
	
    @teaching_course = TeachingCourse.find(params[:id])

    respond_to do |format|
      if @teaching_course.update_attributes(params[:teaching_course])
        format.html { redirect_to @teaching_course, notice: 'Teaching course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teaching_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_courses/1
  # DELETE /teaching_courses/1.json
  def destroy
    @teaching_course = TeachingCourse.find(params[:id])
    @teaching_course.destroy

    respond_to do |format|
      format.html { redirect_to teaching_courses_url }
      format.json { head :no_content }
    end
  end
end
