class SubjectsController < ApplicationController
  before_filter :throw_404_unless_subject_exists

  def show
  end

  helper_method :context
  def context
    @context ||= Capiche::Context.new(subject, answer_params)
  end

private
  def throw_404_unless_subject_exists
    render_404 unless subject.present?
  end

  def subject
    @subject ||= Subject.find_by_slug(params[:slug])
  end

  def answer_params
    params.except(:action, :controller, :format, :slug)
  end
end
