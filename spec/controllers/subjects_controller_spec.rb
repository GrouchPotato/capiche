require 'spec_helper'

describe SubjectsController do
  describe "GET show" do
    let (:subject_schema_slug) { 'a-subject' }
    let (:subject_schema) { create(:schema_subject, slug: subject_schema_slug)}

    context "with a subject schema" do
      it "should build a subject from the schema" do
        Subject.should_receive(:new).with(subject_schema).and_return(:a_built_subject)
        get :show, slug: subject_schema_slug
        assigns(:subject).should == :a_built_subject
      end

    end

    context "without a valid subject schema slug" do
      before { get :show, slug: 'nonexistent'}

      specify { response.status.should == 404 }
    end
  end
end
