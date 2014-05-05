require 'spec_helper'

describe QuestionCollectionExtensions do
  let(:test_model) { Subject }
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
  subject { test_model.new(questions: questions) }

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
