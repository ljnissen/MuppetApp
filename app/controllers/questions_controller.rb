class QuestionsController < ApplicationController
  #before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :find_survey
  
  def index
    # @questions = Question.where(:survey_id => @survey.id).sorted
    @questions = Question.all.sorted
    @surveys = Survey.all
  end

  def show
    @question = Question.find(params[:id])
    @survey = Survey.find(params[:id])
    @questions = Question.all.sorted
    @surveys = Survey.all
  end

  def new
    @question = Question.new({:survey_id => @survey.id})
  end

  # POST /surveys
  # POST /surveys.json
  def create
      @question = Question.new(question_params)
      if @question.save
        flash[:notice] = 'Question was successfully created.' 
        redirect_to(:action => 'index', :survey_id => @survey.id)
      else
        render('new') 
      end
  end

  # GET /surveys/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question updated successfully."
      redirect_to(:action => 'show', :id => @question.id, :survey_id => @survey.id)
    else
      render('edit')
    end
  end 

  def check
    
  end

  def delete
    @question = Question.find(params[:id])
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question destroyed successfully."
    redirect_to(:action => 'index', :survey_id => @survey.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:survey_id, :id, :content, answers_attributes: [:question_id, :id, :correct_answer, :content])
    end

    def find_survey
      # If in each action calling this method (find_survey) has :survey_id sent
      if params[:survey_id]
        # We will then go to the database and look for (and find) :survey_id and set that to @survey. 
        @survey = Survey.find(params[:survey_id])
      end
    end
end