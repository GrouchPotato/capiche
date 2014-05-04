require 'spec_helper'

describe Question do
  describe "validations" do
    specify { build(:question, subject: nil).should_not be_valid }
    specify { build(:question, text: nil).should_not be_valid }

    describe :key do
      let (:subject) { build(:subject) }

      specify { build(:question, key: nil).should_not be_valid }

      it "should require question key to be unique to the subject" do
        create(:question, subject: subject, key: "a_key").should be_valid
        build(:question, subject: subject, key: "a_key").should_not be_valid
        build(:question, key: "a_key").should be_valid
      end
    end
  end
end
