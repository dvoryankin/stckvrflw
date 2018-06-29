require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'association' do
    it { should have_many(:answers).dependent(:destroy) }
  end

  it { should validate_presence_of :title}
  it { should validate_presence_of :body}

  # it 'validates presence of title' do
  #   expect(Question.new(body: '123')).to_not be_valid
  # end

  # it 'validates presence of title' do
  #   expect(Question.new(title: '456')).to_not be_valid
  # end
end
