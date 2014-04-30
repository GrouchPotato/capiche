class ModelBase
  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  def assign_attributes(attributes)
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end
end
