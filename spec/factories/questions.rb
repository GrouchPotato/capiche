FactoryGirl.define do
  factory :question do
    sequence(:text) { |n| "Should you answer question #{n}?" }
    sequence(:key) { |n| "answer_question_#{n}?" }
    association :subject
  end

  factory :yes_no_question, parent: :question, class: YesNoQuestion do
  end
end
