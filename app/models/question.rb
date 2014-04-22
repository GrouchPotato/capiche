class Question < ActiveRecord::Base
  belongs_to :subject, inverse_of: :questions
end
