require 'spec_helper'

describe Schema::Question do
  describe "validations" do
    specify { build(:schema_question, subject: nil).should_not be_valid }
    specify { build(:schema_question, text: nil).should_not be_valid }

    describe :key do
      let (:schema_subject) { build(:schema_subject) }

      specify { build(:schema_question, key: nil).should_not be_valid }

      it "should require question key to be unique to the subject" do
        create(:schema_question, subject: schema_subject, key: "a_key").should be_valid
        build(:schema_question, subject: schema_subject, key: "a_key").should_not be_valid
        build(:schema_question, key: "a_key").should be_valid
      end
    end
  end
end
