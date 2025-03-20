# require 'spec_helper'
require 'string_calculator'
RSpec.describe StringCalculator do
    it 'should return 0 if the string is empty' do
      expect(StringCalculator.new.add('')).to eq(0)
    end

    it 'should return sum of numbers passed in a string with comma delimiter' do
      expect(StringCalculator.new.add('2,3')).to eq(5)
    end

    it 'should return sum of unknown amount of numbers in a string' do
      expect(StringCalculator.new.add('10, 10, 10, 10, 10, 10, 10, 10, 10, 10')).to eq(100)
    end

    it 'should return sum of numbers with new line delimiter' do
      expect(StringCalculator.new.add('1\n2,3')).to eq(6)
    end

    it 'should return sum of numbers with differnt delimiter(;) specified at the start of the string' do
      expect(StringCalculator.new.add('//;\n1;2')).to eq(3)
    end

    it 'should return sum of numbers with differnt delimiter(*) specified at the start of the string' do
      expect(StringCalculator.new.add('//*\n3*2')).to eq(5)
    end

    it 'should raise error when negative numbers are in string' do
      expect{StringCalculator.new.add('//;\n1;2;3;-1')}.to raise_error('negatives not allowed -1')
    end

    it 'should include negative numbers in error message when there are negative numbers in string' do
      expect{StringCalculator.new.add('//;\n1;2;3;-1;-10')}.to raise_error('negatives not allowed -1,-10')
    end

    it 'should return no.of times string calculator is invoked' do
      expect(StringCalculator.get_called_count()).to eq(9)
    end

    it 'should avoid numbers greater than 1000' do
      expect(StringCalculator.new.add("1,2,3,4,1999")).to eq(10)
    end

    it 'should accpet delimters of any length' do
      expect(StringCalculator.new.add('//[***]\n1***2***3”')).to eq(6)
    end

    it 'should accept multiple delimters' do
      expect(StringCalculator.new.add('//[*][;]\n1*2;3”')).to eq(6)
    end
end