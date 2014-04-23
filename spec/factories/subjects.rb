FactoryGirl.define do
  factory :subject do
    sequence(:slug) {|n| "subject-#{n}"}
  end
end
