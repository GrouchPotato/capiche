FactoryGirl.define do
  factory :schema_question, class: Schema::Question do
    sequence(:text) { |n| "Should you answer question #{n}?" }
    sequence(:key) { |n| "answer_question_#{n}?" }
    association :subject, factory: :schema_subject
  end

  factory :schema_yes_no_question, parent: :schema_question, class: Schema::YesNoQuestion do
  end
end
