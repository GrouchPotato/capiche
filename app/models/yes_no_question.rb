class YesNoQuestion < Question

  def answer=(value)
    @answer = (value == 'yes' || value == true)
  end
end
