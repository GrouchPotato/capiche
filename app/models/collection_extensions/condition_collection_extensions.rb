module ConditionCollectionExtensions
  def satisfied?(context)
    all? { |condition| condition.satisfied?(context) }
  end

  def to_s
    map(&:to_s).join(', ')
  end
end
