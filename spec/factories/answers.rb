FactoryBot.define do
  factory :answer do
    sequence(:body) { |n| "Answer #{n} text" }
  end

  factory :invalid_answer, class: "Answer" do
    body nil
  end
end
