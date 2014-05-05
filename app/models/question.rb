class Question < ActiveRecord::Base
  belongs_to :subject, inverse_of: :questions
  has_many :conditions, -> { extending ConditionCollectionExtensions }

  validates :subject, :text, presence: true
  validates :key, presence: true, uniqueness: { scope: :subject }

  def self.parse_answer(raw_answer)
    raw_answer
  end

  def parse_answer(raw_answer)
    self.class.parse_answer(raw_answer)
  end

  def to_partial_path
    "questions/#{self.class.name.underscore}"
  end
end
