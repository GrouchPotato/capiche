class BoolCondition < Condition
  def satisfied?(context)
    if comparator == 'true'
      context[input_key].present?
    else
      context[input_key].blank?
    end
  end
end
