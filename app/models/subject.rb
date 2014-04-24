class Subject < ActiveRecord::Base
  has_many :questions, inverse_of: :subject

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true

  def to_param
    slug
  end
end
