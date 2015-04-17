class QuizzesController < ApplicationController
  

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
