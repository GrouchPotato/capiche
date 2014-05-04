require 'spec_helper'

describe YesNoQuestion do
  describe :parse_answer do
    specify { subject.parse_answer('yes').should == true }
    specify { subject.parse_answer('no').should == false }
    specify { subject.parse_answer('foo').should == false }
    specify { subject.parse_answer(true).should == true }
    specify { subject.parse_answer(nil).should == false }
  end
end
