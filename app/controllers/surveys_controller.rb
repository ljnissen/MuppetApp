class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  # before_action :find_question

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    #@surveys = Survey.where(:question_id => @question.id).all
    @survey = Survey.find(params[:id])
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    6.times { @survey.questions.build }
  end

  # POST /surveys
  # POST /surveys.json
  def create
      @survey = Survey.new(survey_params)
      if @survey.save
        flash[:notice] = 'Survey was successfully created.' 
        redirect_to(:action => 'index')
      else
        render('new') 
      end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

    # PATCH/PUT /surveys/1
    # PATCH/PUT /surveys/1.json
  def update
    #Find an existing object using form parameters
    @survey = Survey.find(params[:id])
    #Update the object
    if @survey.update_attributes(survey_params)
      flash[:notice] = "Page updated successfully."
      #If update succeeds, redirect to 'show' action.
      redirect_to(:action => 'show', :id => @survey.id)
    else
      #Else redisplay the 'edit' form.
      render('edit')
    end
  end 

  def delete
    @survey = Survey.find(params[:id])
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey = Survey.find(params[:id]).destroy
    flash[:notice] = "Survey destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name)
    end

    #def find_question
    #  if params[:question_id]
    #      @question = Question.find(params[:question_id])
    #  end
    #end
end
