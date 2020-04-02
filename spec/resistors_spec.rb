# frozen_string_literal: true

RSpec.describe Tools::Resistors do
  describe 'returns a two digit number for input of two colors' do
    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new(%w[Brown Green])
      expect(resistor.base).to eq(15)
    end

    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new(%w[Black Violet])
      expect(resistor.base).to eq(07)
    end

    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new(%w[Violet Violet])
      expect(resistor.base).to eq(77)
    end

    it 'ignores more than two colors for input' do
      resistor = Tools::Resistors.new(%w[Brown Violet Green])
      expect(resistor.base).to eq(17)
    end

    it 'ignores more than two colors for input' do
      resistor = Tools::Resistors.new(%w[Orange Blue Black])
      expect(resistor.base).to eq(36)
    end
  end
  describe 'returns specification for resistance and tolerance' do
    it 'returns 2700000 ohms +/- 5% for input red, violet, green and gold' do
      resistor = Tools::Resistors.new(%w[red violet green gold])
      expected = '2700000 ohms +/- 5%'
      expect(resistor.specification).to eq expected
    end
    it 'returns 4300000000 ohms +/- 0.05% for input yellow, orange, gray and gray' do
      resistor = Tools::Resistors.new(%w[yellow orange gold gray])
      expected = '4.3 ohms +/- 0.05%'
      expect(resistor.specification).to eq expected
    end
    it 'returns default tolerance value if there is no input for tolerance' do
      resistor = Tools::Resistors.new(%w[brown violet red])
      expected = '1700 ohms +/- 20%'
      expect(resistor.specification).to eq expected
    end
  end
end