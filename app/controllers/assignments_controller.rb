class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
	
	@assignments = Assignment.where(:course_number => params[:course_data].to_s)
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	print "params[:id] = #{params[:id].inspect}\n"
	print "params[:course_data] = #{params[:course_data]}\n"
	# print "TeachingCourse.find(params[:id]) = #{TeachingCourse.find(params[:id])}\n"
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "want to make new assignment params[:course_data] = #{params[:course_data]}\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	
	
	
    @assignment = Assignment.new
	# @assignment.rel_course_number = params[:course_data]
	$course_data =  params[:course_data]
	# print "@assignment.rel_course_number = #{@assignment.rel_course_number}\n"
	# print "$course_data = #{$course_data}\n"
	
	# @rel_course_number = 
	
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
	
	params[:assignment][:course_number] = params[:course_data]
	
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "creating assignment params[:course_data] = #{params[:course_data]}\n"
	# print "@rel_course_number = #{@rel_course_number}\n"
	# print "params[:assignment][:rel_course_number] = #{params[:assignment][:rel_course_number]}\n"
	# print "@assignment = #{@assignment}\n"
	# print "$course_data = #{$course_data}\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	# print "\n"
	
	params[:assignment][:course_number] = $course_data
	
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	print "$course_data = #{$course_data}\n"
	print "creating params[:assignment][:course_number] = #{params[:assignment][:course_number]}\n"
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	print "\n"
	
    @assignment = Assignment.new(params[:assignment])
	
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end
end
