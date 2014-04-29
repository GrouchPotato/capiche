require 'spec_helper'

describe Subject do
  let(:subject_schema_slug) { 'a-subject' }
  let(:subject_schema_title) { "A subject" }
  let(:subject_schema_intro) { "This is a subject." }
  let(:subject_schema_questions) { [:a_question, :another_question] }
  let(:subject_schema) {
    OpenStruct.new(
      slug: subject_schema_slug,
      title: subject_schema_title,
      intro: subject_schema_intro,
      questions: subject_schema_questions
    )
  }
  let(:built) { Subject.new(subject_schema) }

  describe :initialize do
    specify { built.should be_a Subject }
    specify { built.title.should == subject_schema_title }
    specify { built.intro.should == subject_schema_intro }
  end

  describe :to_param do
    specify { built.to_param.should == subject_schema_slug }
  end
end
