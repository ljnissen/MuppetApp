class AnswersController < ApplicationController
  
  def check
    @answer = Answer.find(params[:id])
    @correct = (params[:guess] == @answers.correct_answer) 
  end

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
end
