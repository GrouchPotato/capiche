require 'spec_helper'

describe BoolCondition do
  let(:context_key) { "context_key" }
  let(:context_value) { true }
  let(:context) { { context_key => context_value } }
  subject { build(:bool_condition, input_key: context_key, comparator: comparator) }

  describe :satisfied? do
    context "with a positive comparator" do
      let(:comparator) { 'true' }

      context "with a true input value" do
        let(:context_value) { true }
        specify { subject.satisfied?(context).should be_true }
      end

      context "with a lengthy string input value" do
        let(:context_value) { 'string' }
        specify { subject.satisfied?(context).should be_true }
      end

      context "with a false input value" do
        let(:context_value) { false }
        specify { subject.satisfied?(context).should be_false }
      end

      context "with a nil input value" do
        let(:context_value) { nil }
        specify { subject.satisfied?(context).should be_false }
      end

      context "with a blank string input value" do
        let(:context_value) { '' }
        specify { subject.satisfied?(context).should be_false }
      end
    end

    context "with a negative comparator" do
      let(:comparator) { 'false' }

      context "with a true input value" do
        let(:context_value) { true }
        specify { subject.satisfied?(context).should be_false }
      end

      context "with a lengthy string input value" do
        let(:context_value) { 'string' }
        specify { subject.satisfied?(context).should be_false }
      end

      context "with a false input value" do
        let(:context_value) { false }
        specify { subject.satisfied?(context).should be_true }
      end

      context "with a nil input value" do
        let(:context_value) { nil }
        specify { subject.satisfied?(context).should be_true }
      end

      context "with a blank string input value" do
        let(:context_value) { '' }
        specify { subject.satisfied?(context).should be_true }
      end
    end
  end
end
