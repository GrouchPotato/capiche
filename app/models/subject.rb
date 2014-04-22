class Subject < ActiveRecord::Base
  has_many :questions, inverse_of: :subject
end
