class AnswersController < ApplicationController
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end

  def check
    @answer = Answer.find(params[:id])
    @correct = (params[:guess] == @answers.correct_answer)
    redirect_to(anwers_path)  
  end
end
