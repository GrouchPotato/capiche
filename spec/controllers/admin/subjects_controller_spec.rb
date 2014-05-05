require 'spec_helper'

describe Admin::SubjectsController do
  describe "GET index" do
    before { get :index }

    context "With some subjects" do
      let!(:subjects) { 2.times.map {|n| create :subject } }

      specify { assigns(:subjects).should == subjects }
    end
  end

  describe "GET show" do
    before { get :show, id: subject_slug }

    context "when subject doesn't exist" do
      let(:subject_slug) { 'nonexistent-subject' }

      specify { response.status.should == 404 }
    end

    context "with a subject" do
      let(:capiche_subject) { create :subject }
      let(:subject_slug) { capiche_subject.try(:slug) }

      specify { assigns(:subject).should == capiche_subject }
    end
  end

  describe "GET edit" do
    before { get :edit, id: subject_slug }

    context "when subject doesn't exist" do
      let(:subject_slug) { 'nonexistent-subject' }

      specify { response.status.should == 404 }
    end

    context "with a subject" do
      let(:capiche_subject) { create :subject }
      let(:subject_slug) { capiche_subject.try(:slug) }

      specify { assigns(:subject).should == capiche_subject }
    end
  end

  describe "PUT update" do
    let(:capiche_subject) { create :subject }
    let(:subject_slug) { capiche_subject.try(:slug) }
    let(:subject_params) { {
      title: "Another title",
      intro: "Another intro"
    } }
    let(:params) { { id: subject_slug, subject: subject_params } }
    before { put :update, params }

    it "updates the subject" do
      capiche_subject.reload
      subject_params.each do |key, value|
        capiche_subject.send(key).should == value
      end
    end

    specify { response.should redirect_to admin_subject_path(capiche_subject) }

    context "with invalid params" do
      let(:subject_params) { {
        title: "",
        intro: "Another intro"
      } }

      specify { response.should redirect_to edit_admin_subject_path(capiche_subject) }
    end

    context "without a subject" do
      let(:subject_slug) { "nonexistent-subject" }
      specify { response.status.should == 404 }
    end
  end
end
