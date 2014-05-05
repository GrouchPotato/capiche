module QuestionCollectionExtensions
  def find_by_key(key)
    select {|question| question.key == key}.first
  end

  def answered(context)
    select {|question|
      context.has_key?(question.key)
    }
  end

  def next(context)
    select {|question|
      !context.has_key?(question.key) && question.conditions.satisfied?(context)
    }.first
  end
end
