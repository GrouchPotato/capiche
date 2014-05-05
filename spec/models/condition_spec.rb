require 'spec_helper'

describe Condition do
  describe 'validations' do
    specify { build(:condition, input_key: nil).should_not be_valid }
  end
end
