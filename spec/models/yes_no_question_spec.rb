require 'spec_helper'

describe YesNoQuestion do
  subject { YesNoQuestion.new }

  describe :answer= do
    before { subject.answer = value }

    context "with a string 'yes' value" do
      let(:value) { "yes" }
      specify { subject.answer.should == true }
    end

    context "with a string 'no' value" do
      let(:value) { "no" }
      specify { subject.answer.should == false }
    end

    context "with a bool value" do
      let(:value) { true }
      specify { subject.answer.should == true }
    end
  end
end
