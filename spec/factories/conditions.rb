FactoryGirl.define do
  factory :condition do
    input_key 'some_key'
  end

  factory :bool_condition, parent: :condition, class: BoolCondition do
  end
end
