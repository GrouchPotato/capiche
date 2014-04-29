require 'spec_helper'

describe SubjectsController do
  context "with a subject" do
    let(:subject) { create(:schema_subject, slug: 'subject') }
    before { get :show, slug: subject.slug }

    specify {
      assigns(:subject).should be_a SubjectPresenter
      assigns(:subject).subject.should == subject
    }
  end

  context "without a subject" do
    before { get :show, slug: 'nonexistent'}

    specify { response.status.should == 404 }
  end
end
