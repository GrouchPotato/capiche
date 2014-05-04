class Subject < ActiveRecord::Base
  has_many :questions, -> { extending QuestionCollectionExtensions }

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true

  def to_param
    slug
  end
end
