class AnswersController < ApplicationController
  before_action :load_question, only: [:create]

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question, notice: 'Your answer successfully created.'
    else
      flash.now[:error] = 'Your answer is not created.'
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def load_question
    @question = Question.find(params[:question_id])
  end
end
