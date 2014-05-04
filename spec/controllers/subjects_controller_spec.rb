require 'spec_helper'

describe SubjectsController do
  let(:capiche_subject) { create(:subject) }

  describe "GET show" do
    context "with a valid subject slug" do
      let(:request_subject_slug) { capiche_subject.slug }
      before { get :show, slug: request_subject_slug }

      specify { response.status.should == 200 }
    end

    context "without a valid subject slug" do
      let(:request_subject_slug) { 'nonexistant-slug' }
      before { get :show, slug: request_subject_slug }

      specify { response.status.should == 404 }
    end
  end

  describe :context do
    let(:request_subject_slug) { capiche_subject.slug }

    it "should build a context, passing in subject and answers" do
      Capiche::Context.should_receive(:new).with(capiche_subject, {'answer_1' => 'yes', 'answer_2' => 'no'}).and_return(:a_context)
      get :show, slug: request_subject_slug, answer_1: 'yes', answer_2: 'no'
      controller.context.should == :a_context
    end
  end
end
