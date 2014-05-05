class Condition < ActiveRecord::Base
  belongs_to :conditionable, polymorphic: true
end
