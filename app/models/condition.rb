class Condition < ActiveRecord::Base
  belongs_to :conditionable, polymorphic: true
  validates :input_key, presence: true

  def satisfied?(context)
    true
  end

  def to_s
    raise NotImplementedError
  end
end
