require_relative 'spec_helper'
require_relative '../app/bitmap'



RSpec.describe Bitmap do
  

  describe "#initialize" do
    before { subject }

    context "when columns and rows are non-acceptable (< 1)" do
      subject { Bitmap.new(0,0) } 
      it "shouldn't create bitmap" do
        expect(subject.columns).to eq(nil)
        expect(subject.rows).to eq(nil)
      end
    end

    context "when columns and rows are non-acceptable (> 250)" do
      subject { Bitmap.new(256,512) } 
      it "shouldn't create bitmap" do
        expect(subject.columns).to eq(nil)
        expect(subject.rows).to eq(nil)
      end
    end

    context "when columns and rows are acceptable (between 1 and 250)" do
      subject { Bitmap.new(3,6) } 
      it "should create bitmap" do
        expect(subject.columns).to eq(3)
        expect(subject.rows).to eq(6)
      end
    end
  end

end