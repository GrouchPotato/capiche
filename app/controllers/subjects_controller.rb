class SubjectsController < ApplicationController
  def show
    subject_schema = Schema::Subject.find_by_slug(params[:slug])
    if subject_schema.nil?
      render_404
    else
      @subject = Subject.new(subject_schema)
    end
  end
end
