module ApplicationHelper
  def previous_answer_fields(answers)
    answers.to_a.map { |answer|
      hidden_field_tag(*answer)
    }.join.html_safe
  end
end
