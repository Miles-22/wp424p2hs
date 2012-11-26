class AssignmentQuestionsController < ApplicationController
  # GET /assignment_questions
  # GET /assignment_questions.json
  def index
    @assignment_questions = AssignmentQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignment_questions }
    end
  end

  # GET /assignment_questions/1
  # GET /assignment_questions/1.json
  def show
    @assignment_question = AssignmentQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment_question }
    end
  end

  # GET /assignment_questions/new
  # GET /assignment_questions/new.json
  def new
    @assignment_question = AssignmentQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment_question }
    end
  end

  # GET /assignment_questions/1/edit
  def edit
    @assignment_question = AssignmentQuestion.find(params[:id])
  end

  # POST /assignment_questions
  # POST /assignment_questions.json
  def create
    @assignment_question = AssignmentQuestion.new(params[:assignment_question])

    respond_to do |format|
      if @assignment_question.save
        format.html { redirect_to @assignment_question, notice: 'Assignment question was successfully created.' }
        format.json { render json: @assignment_question, status: :created, location: @assignment_question }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignment_questions/1
  # PUT /assignment_questions/1.json
  def update
    @assignment_question = AssignmentQuestion.find(params[:id])

    respond_to do |format|
      if @assignment_question.update_attributes(params[:assignment_question])
        format.html { redirect_to @assignment_question, notice: 'Assignment question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_questions/1
  # DELETE /assignment_questions/1.json
  def destroy
    @assignment_question = AssignmentQuestion.find(params[:id])
    @assignment_question.destroy

    respond_to do |format|
      format.html { redirect_to assignment_questions_url }
      format.json { head :no_content }
    end
  end
end
