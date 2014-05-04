module ApplicationHelper
  def previous_answer_fields(answers)
    answers.to_a.map { |answer|
      key = answer[0]
      value = answer[1]
      if !!value == value # --> value.is_a? Bool
        value = value ? 'yes' : 'no'
      end

      hidden_field_tag(key, value)
    }.join.html_safe
  end
end
