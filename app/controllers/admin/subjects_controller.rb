class Admin::SubjectsController < Admin::AdminController
  before_filter :get_subject_or_render_404, only: [:show, :edit, :update]

  def index
    @subjects = Subject.all
  end

  def update
    if @subject.update_attributes(subject_params)
      redirect_to admin_subject_path(@subject)
    else
      redirect_to edit_admin_subject_path(@subject)
    end
  end

private
  def get_subject_or_render_404
    @subject = Subject.find_by_slug(params[:id])
    render_404 if @subject.nil?
  end

  def subject_params
    params[:subject].permit(:title, :slug, :intro)
  end
end
