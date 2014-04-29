class Schema::Question < ActiveRecord::Base
  belongs_to :subject, inverse_of: :questions

  validates :subject, :text, presence: true
  validates :key, presence: true, uniqueness: { scope: :subject }
end
