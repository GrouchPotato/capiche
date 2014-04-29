require 'spec_helper'

describe Schema::Subject do
  it "should identify by it's slug" do
    build(:schema_subject, slug: 'a-slug').to_param.should == 'a-slug'
  end

  describe :validations do
    specify { build(:schema_subject, slug: nil).should_not be_valid }
    specify { build(:schema_subject, title: nil).should_not be_valid }

    it "should not allow duplicate slugs" do
      create(:schema_subject, slug: 'duplicate-slug')
      build(:schema_subject, slug: 'duplicate-slug').should_not be_valid
    end
  end
end
