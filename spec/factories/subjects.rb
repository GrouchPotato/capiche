FactoryGirl.define do
  factory :subject do
    sequence(:slug) {|n| "subject-#{n}"}
    sequence(:title) {|n| "Subject title #{n}"}
  end
end
