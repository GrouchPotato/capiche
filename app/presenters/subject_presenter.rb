class SubjectPresenter
  attr_accessor :subject

  delegate :slug, :to_param, :title, :intro, :questions, to: :subject

  def initialize(subject)
    @subject = subject
  end
end
