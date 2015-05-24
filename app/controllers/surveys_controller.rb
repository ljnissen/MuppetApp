class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    @surveys = Survey.all
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @surveys = Survey.all

  end

  # POST /surveys
  # POST /surveys.json
  def create
      @survey = Survey.new(survey_params)
      @surveys = Survey.all
      if @survey.save
        flash[:notice] = 'Survey was successfully created.' 
        redirect_to(:controller => :questions, :action => :new, :survey_id => @survey.id)
      else
        @surveys = Survey.all
        render('new') 
      end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
    @surveys = Survey.all    
  end

    # PATCH/PUT /surveys/1
    # PATCH/PUT /surveys/1.json
  def update
    #Find an existing object using form parameters
    @survey = Survey.find(params[:id])
    #Update the object
    if @survey.update_attributes(survey_params)
      flash[:notice] = "Survey updated successfully."
      #If update succeeds, redirect to 'show' action.
      redirect_to(:action => 'show', :id => @survey.id)
    else
      @surveys = Survey.all 
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
      params.require(:survey).permit(:name, :id, :content, questions_attributes: [:survey_id, :id, :content, answers_attributes: [:id, :question_id, :correct_answer, :guess, :content], correct_answers_attributes: [:guess, :question_id]])
    end
end
