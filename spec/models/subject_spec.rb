require 'spec_helper'

describe Subject do
  it "should identify by it's slug" do
    build(:subject, slug: 'a-slug').to_param.should == 'a-slug'
  end

  describe :validations do
    specify { build(:subject, slug: nil).should_not be_valid }
    specify { build(:subject, title: nil).should_not be_valid }

    it "should not allow duplicate slugs" do
      create(:subject, slug: 'duplicate-slug')
      build(:subject, slug: 'duplicate-slug').should_not be_valid
    end
  end
end
