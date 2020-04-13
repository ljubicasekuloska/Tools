# frozen_string_literal: true

RSpec.describe Tools::OddNumbers do
  describe 'returns all of the integers which appears an odd number of times' do
    it 'returns all of the integers which appears an odd number of times' do
      niza = Tools::OddNumbers.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
      expect(niza.all_odd_numbers).to eq([5, -1])
    end
    it 'returns all of the integers which appears an odd number of times' do
      niza = Tools::OddNumbers.new([10])
      expect(niza.all_odd_numbers).to eq([10])
    end
    it 'returns all of the integers which appears an odd number of times' do
      niza = Tools::OddNumbers.new([1, 1, 7, 2, -2, 5, 2, 4, 4])
      expect(niza.all_odd_numbers).to eq([7, -2, 5])
    end
  end
  describe 'returns the first integer which appears an odd number of times' do
    it 'returns the first integer which appears an odd number of times' do
      niza = Tools::OddNumbers.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
      expect(niza.first_odd_number).to eq(5)
    end
    it 'returns the first integer which appears an odd number of times' do
      niza = Tools::OddNumbers.new([10])
      expect(niza.first_odd_number).to eq(10)
    end
    it 'returns the first integer which appears an odd number of times' do
      niza = Tools::OddNumbers.new([1, 1, 7, 2, -2, 5, 2, 4, 4])
      expect(niza.first_odd_number).to eq(7)
    end
  end
end
