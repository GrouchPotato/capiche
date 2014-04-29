class Subject
  attr_reader :schema

  delegate :title, :intro, to: :schema

  def initialize(schema)
    @schema = schema
  end

  def to_param
    schema.slug
  end
end
