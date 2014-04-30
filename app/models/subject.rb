class Subject < ModelBase
  attr_reader :schema, :questions

  delegate :title, :intro, to: :schema

  def initialize(schema, answers = {})
    @schema = schema
    build_questions(schema, answers)
  end

  def to_param
    schema.slug
  end

private
  def build_questions(schema, answers)
    @questions = schema.questions.map do |schema_question|
      question_klass = Object.const_get(schema_question.type.sub('Schema::', ''))
      question_klass.new({
        text: schema_question.text,
        answer: answers[schema_question.key]
      })
    end
  end
end
