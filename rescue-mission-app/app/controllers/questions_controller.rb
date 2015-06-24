require 'pry'
class QuestionsController < ApplicationController
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Your edit has been updated'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Something went wrong'
      render :edit
    end
  end

  def index
    @questions = Question.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question was removed"
    redirect_to questions_path
  end

  protected

  def question_params
    params.require(:question).permit(:title, :body)
  end 

  # def answer_params
  #   params.require(:answer).permit(:body)
  # end 
end
