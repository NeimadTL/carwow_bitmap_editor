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


  describe "#color_point" do
    before { subject }

    context "when color_point is called" do
      subject do 
      	bitmap = Bitmap.new(6, 2)
      	bitmap.color_point(1,1, 'A')
      	bitmap.color_point(1,2, 'B')
      	bitmap.color_point(6,1, 'C')
      	bitmap.color_point(6,2, 'D')
      	bitmap
      end 
      it "should color the point passed with the color passed" do
        expect(subject.array[0][0]).to include('A')
        expect(subject.array[1][0]).to include('B')
        expect(subject.array[0][5]).to include('C')
        expect(subject.array[1][5]).to include('D')
      end
    end
  end


  describe "#clear_bitmap" do
    before { subject }

    context "when clear_bitmap is called" do
      subject do 
      	bitmap = Bitmap.new(6, 2)
      	bitmap.color_point(1,1, 'A')
      	bitmap.color_point(1,2, 'B')
      	bitmap.color_point(6,1, 'C')
      	bitmap.color_point(6,2, 'D')
      	bitmap.clear_bitmap
      	bitmap
      end 
      it "should reset bitmap with the white color (O)" do
        subject.array.each_with_index do |row, row_index|        
          row.each_with_index do |col, col_index|
            expect(subject.array[row_index][col_index]).to include('O')
          end
        end
      end
    end
  end


  describe "#draw_vertical_line" do
    before { subject }

    context "when draw_vertical_line is called with wrong parameters" do
      subject do 
      	bitmap = Bitmap.new(0, 0)
      	bitmap.draw_vertical_line(7, 1, 6, 'A') # in column 7
      	bitmap
      end 
    end
    it "shouldn't draw anything" do
      subject.array.each_with_index do |row, row_index|        
        row.each_with_index do |col, col_index|
          expect(subject.array[row_index][col_index]).to include('O')
        end
      end
    end


    context "when draw_vertical_line is called with good parameters" do
      subject do 
      	bitmap = Bitmap.new(6, 6)
      	bitmap.draw_vertical_line(3, 1, 6, 'A')
      	bitmap
      end 
      it "should draw a vertical segement accord to the parameters" do
        subject.array.each_with_index do |row, row_index|        
            expect(subject.array[row_index][2]).to include('A')
        end
      end
    end
  end
  
   

end