class YesNoQuestion < Question

  def parse_answer(raw_answer)
    if raw_answer.is_a? String
      raw_answer.downcase == 'yes'
    else
      !!raw_answer
    end
  end
end
