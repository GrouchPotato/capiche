require 'spec_helper'

describe ModelBase do
  let(:model) {
    class TestModel < ModelBase
      attr_accessor :foo, :bar
    end
    TestModel
  }
  let(:attributes) { {
    foo: 'wibble',
    bar: 'wobble'
  } }

  describe :initialize do
    subject { model.new(attributes) }

    specify { subject.foo.should == attributes[:foo] }
    specify { subject.bar.should == attributes[:bar] }
  end
end
