class QuizzesController < ApplicationController
  

  def index
    @quizzes = Quiz.sorted
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
