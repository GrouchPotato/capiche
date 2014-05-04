require 'spec_helper'

describe Capiche::Context do
  let(:questions) { [] }
  let(:capiche_subject) { build :subject, questions: questions }
  let(:answers) { {} }
  subject { Capiche::Context.new(capiche_subject, answers) }

  describe 'quacking like a hash' do
    let(:questions) { [
      build(:question, key: 'is_it_an_animal'),
      build(:question, key: 'is_it_a_llama')
    ] }
    let(:answers) { {
      'is_it_an_animal' => 'yes',
      'is_it_a_llama' => 'no'
    } }

    describe :[] do
      it 'should expose answers as hash members' do
        subject['is_it_an_animal'].should == 'yes'
        subject['is_it_a_llama'].should == 'no'
      end

      it 'should accept symbols as keys' do
        subject[:is_it_an_animal].should == 'yes'
      end
    end

    describe :has_key? do
      specify { subject.has_key?('is_it_an_animal').should be_true }
      specify { subject.has_key?(:is_it_an_animal).should be_true }
      specify { subject.has_key?('meaning_of_life').should be_false }
    end
  end

  describe 'answer parsing' do
    let(:question_1) { build(:question, key: 'question_1') }
    let(:question_2) { build(:question, key: 'question_2') }
    let(:questions) {
      [question_1, question_2]
    }
    let(:answers) { {
      'question_1' => 'answer_1',
      'question_2' => 'answer_2'
    } }

    it "should parse answers with the appropriate question" do
      question_1.stub(:parse_answer).with('answer_1').and_return(:parsed_answer_1)
      question_2.stub(:parse_answer).with('answer_2').and_return(:parsed_answer_2)

      subject['question_1'].should == :parsed_answer_1
      subject['question_2'].should == :parsed_answer_2
    end
  end

  describe :next_question do
    it "should ask the question collection for the next question" do
      capiche_subject.questions.stub(:next).with(subject).and_return(:the_next_question)
      subject.next_question.should == :the_next_question
    end
  end

  describe :all_answered? do
    let(:question_1) { build(:question, key: 'question_1') }
    let(:question_2) { build(:question, key: 'question_2') }
    let(:questions) {
      [question_1, question_2]
    }

    context "when there's an answer for each question" do
      let(:answers) { {
        'question_1' => 'answer_1',
        'question_2' => 'answer_2'
      } }

      specify { subject.all_answered?.should be_true }
    end

    context "when there's an answer missing" do
      let(:answers) { {
        'question_1' => 'answer_1'
      } }

      specify { subject.all_answered?.should be_false }
    end
  end

  describe :render_outcome do
    let(:outcome) { "Dodgey mustache" }
    let(:capiche_subject) { build(:subject, outcome: outcome) }

    it "should use mustache to render the outcome, passing itself as the mustache context hash" do
      Mustache.should_receive(:render).with(outcome, subject).and_return(:rendered_outcome)
      subject.render_outcome.should == :rendered_outcome
    end
  end
end
