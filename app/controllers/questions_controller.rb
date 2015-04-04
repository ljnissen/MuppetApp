class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

    # GET /surveys/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @question = Question.new(question_params)
      if @question.save
        redirect_to(:action => 'index')
        flash[:notice] = 'Question was successfully created.' 
      else
        render('new') 
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
def update
  @question = Question.find(params[:id])
  if @question.update_attributes(question_params)
    flash[:notice] = "Question updated successfully."
    redirect_to(:action => 'show', :id => @question.id)
  else
    render('edit')
  end
end 

  def delete
    @question = Question.find(params[:id])
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:notice] = "Question destroyed successfully."
    redirect_to(:action => 'index')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:survey_id, :content)
    end
