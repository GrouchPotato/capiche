require 'spec_helper'

describe ApplicationHelper do
  describe :previous_answer_fields do
    it "should return a list of hidden fields" do
      answers = { "is_human" => 'yes', "is_hairy" => 'no' }
      rendered_fields = Nokogiri::HTML::DocumentFragment.parse(helper.previous_answer_fields(answers)).css('input')

      rendered_fields[0][:type].should == 'hidden'
      rendered_fields[0][:name].should == 'is_human'
      rendered_fields[0][:value].should == 'yes'

      rendered_fields[1][:name].should == 'is_hairy'
      rendered_fields[1][:value].should == 'no'
    end
  end
end
