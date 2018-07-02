require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }
  let(:answer) { create(:answer, question_id: question) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect { post :create, params: { answer: attributes_for(:answer),
                      question_id: question } }.to change(Answer, :count).by(1)
      end

      it 'redirect to question' do
        post :create, params: { answer: attributes_for(:answer), question_id: question }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: { answer: attributes_for(:invalid_answer),
                      question_id: question } }.to_not change(Answer, :count)
      end

      it 're-renders new view' do
        expect { post :create, params: { answer: attributes_for(:invalid_answer),
                                         question_id: question } }
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end
  end
end