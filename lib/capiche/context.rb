class Capiche::Context
  attr_reader :subject, :answers

  def initialize(subject, answers={})
    @subject = subject
    @answers = parse_answers(answers)
  end

  def [](key)
    answers[key.to_s]
  end

  def has_key?(key)
    answers.has_key?(key.to_s)
  end

  def next_question
    subject.questions.next(self)
  end

  def all_answered?
    next_question.nil?
  end

  def render_outcome
    Mustache.render(subject.outcome, self)
  end

private
  def parse_answers(answers)
    answers = answers.dup
    answers.each {|key, value|
      answers[key] = subject.questions.find_by_key(key).try(:parse_answer, value)
    }
    answers
  end
end
