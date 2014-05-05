module ConditionCollectionExtensions
  def satisfied?(context)
    all? { |condition| condition.satisfied?(context) }
  end
end
