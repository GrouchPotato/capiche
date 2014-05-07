require 'spec_helper'

describe ConditionCollectionExtensions do
  let(:test_model) { Question }
  let(:context) { {} }
  let(:satisfied_condition) {
    condition = build(:condition)
    condition.stub(:satisfied?).with(context).and_return true
    condition
  }
  let(:unsatisfied_condition) {
    condition = build(:condition)
    condition.stub(:satisfied?).with(context).and_return false
    condition
  }
  let(:conditions) { [] }
  subject { test_model.new(conditions: conditions) }

  describe :satisfied? do
    context "with two satisfied conditions" do
      let(:conditions) { [ satisfied_condition, satisfied_condition ] }
      specify { subject.conditions.satisfied?(context).should be_true }
    end

    context "with a satisfied condition and an unsatisfied condition" do
      let(:conditions) { [ satisfied_condition, unsatisfied_condition ] }
      specify { subject.conditions.satisfied?(context).should be_false }
    end
  end

  describe :to_s do
    let(:conditions) {
      conditions = [
        satisfied_condition,
        unsatisfied_condition
      ]
      conditions[0].stub(:to_s).and_return('a satisfied condition')
      conditions[1].stub(:to_s).and_return('an usatisfied condition')
      conditions
    }
    it "should concatonate results of Condition.to_s" do
      subject.conditions.to_s.should == "a satisfied condition, an usatisfied condition"
    end
  end
end
