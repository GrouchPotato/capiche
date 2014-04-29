class Question < ActiveRecord::Base
  belongs_to :subject, inverse_of: :questions

  validates :subject, :text, presence: true
  validates :key, presence: true, uniqueness: { scope: :subject }

  def to_partial_path
    "questions/#{self.class.name.underscore}"
  end
end
