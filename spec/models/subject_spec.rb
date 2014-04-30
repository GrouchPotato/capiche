require 'spec_helper'

describe Subject do
  let(:subject_schema_slug) { 'a-subject' }
  let(:subject_schema_title) { "A subject" }
  let(:subject_schema_intro) { "This is a subject." }
  let(:subject_schema_questions) { {} }
  let(:subject_schema) {
    OpenStruct.new(
      slug: subject_schema_slug,
      title: subject_schema_title,
      intro: subject_schema_intro,
      questions: subject_schema_questions
    )
  }
  let(:answers) { {} }
  subject { Subject.new(subject_schema, answers) }

  describe :initialize do
    specify { subject.should be_a Subject }
    specify { subject.title.should == subject_schema_title }
    specify { subject.intro.should == subject_schema_intro }
  end

  describe :to_param do
    specify { subject.to_param.should == subject_schema_slug }
  end

  describe :build_questions do
    let(:subject_schema_questions) { [
      Schema::YesNoQuestion.new(key: 'is_yes', text: 'Is the answer yes?')
    ] }
    let(:answers) { {'is_yes' => true} }
    specify { subject.questions.first.should be_a YesNoQuestion }
    specify { subject.questions.first.text.should == 'Is the answer yes?' }
    specify { subject.questions.first.answer.should == true }
  end
end
