class SubjectsController < ApplicationController
  def show
    @subject = Subject.find_by_slug(params[:slug])
    render_404 if @subject.nil?
  end
end
