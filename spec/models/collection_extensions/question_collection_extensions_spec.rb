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
    'question_1' => true,
    'question_2' => false
  } }
  subject { test_model.new(questions: questions) }

  describe :find_by_key do
    specify { subject.questions.find_by_key('question_3').should == questions[2] }
  end

  describe :answered do
    specify { subject.questions.answered(context).should == questions[0..1] }
  end

  describe :next_question do
    context "question 3 is conditioned out if question 2 is false" do
      let(:questions) { [
        build(:question, key: 'question_1'),
        build(:question, key: 'question_2'),
        build(:question, key: 'question_3', conditions: [
          build(:bool_condition, input_key: 'question_2', comparator: 'true')
        ]),
        build(:question, key: 'question_4'),
        build(:question, key: 'question_5')
      ] }

      it "should return the next unanswered question with satisfied conditions which is question 4" do
        subject.questions.next(context).should == questions[3]
      end
    end
  end
end
