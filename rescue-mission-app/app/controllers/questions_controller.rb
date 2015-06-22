require 'pry'
class QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question was removed"
    redirect_to questions_path
  end

end
