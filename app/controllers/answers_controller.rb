class AnswersController < ApplicationController
  before_action :set_question, only: :create

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      flash.now[:error] = 'Your answer is not created.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
