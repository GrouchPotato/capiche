require 'spec_helper'

describe SubjectPresenter do
  let(:subject_slug) { "a-subject" }
  let(:subject_to_param) { subject_slug }
  let(:subject_title) { "A subject" }
  let(:subject_intro) { "This is a subject." }
  let(:subject_questions) { [:a_question, :another_question] }
  let(:subject) {
    OpenStruct.new(
      slug: subject_slug,
      title: subject_title,
      intro: subject_intro,
      questions: subject_questions
    ).tap{ |sub| sub.stub(:to_param).and_return(subject_to_param) }
  }
  let (:presenter) { SubjectPresenter.new(subject) }

  describe "subject method delegation" do
    specify { presenter.slug.should == subject_slug }
    specify { presenter.to_param.should == subject_to_param }
    specify { presenter.title.should == subject_title }
    specify { presenter.intro.should == subject_intro }
    specify { presenter.questions.should == subject_questions }
  end
end
