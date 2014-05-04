require 'spec_helper'

describe Subject do
  it "should identify by it's slug" do
    build(:subject, slug: 'a-slug').to_param.should == 'a-slug'
  end

  describe :validations do
    specify { build(:subject, slug: nil).should_not be_valid }
    specify { build(:subject, title: nil).should_not be_valid }

    it "should not allow duplicate slugs" do
      create(:subject, slug: 'duplicate-slug')
      build(:subject, slug: 'duplicate-slug').should_not be_valid
    end
  end

  describe :questions do
    let(:questions) { [
      build(:question, key: 'question_1'),
      build(:question, key: 'question_2'),
      build(:question, key: 'question_3'),
      build(:question, key: 'question_4')
    ] }
    let(:context) { {
      'question_1' => 'yes',
      'question_2' => 'yes'
    } }
    subject { build(:subject, questions: questions) }

    describe :find_by_key do
      specify { subject.questions.find_by_key('question_3').should == questions[2] }
    end

    describe :answered do
      specify { subject.questions.answered(context).should == questions[0..1] }
    end

    describe :next_question do
      specify { subject.questions.next(context).should == questions[2] }
    end
  end
end
