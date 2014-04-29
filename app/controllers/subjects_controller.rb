class SubjectsController < ApplicationController
  def show
    subject = Subject.find_by_slug(params[:slug])
    if subject.nil?
      render_404
    else
      @subject = SubjectPresenter.new(subject)
    end
  end
end
