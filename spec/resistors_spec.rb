
RSpec.describe Tools::Resistors do

    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new('Brown', 'Green')
      expect(resistor.output).to eq(15)
    end

    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new('Black', 'Violet')
      expect(resistor.output).to eq(07)
    end
    it 'returns a two digit number for input of two colors' do
      resistor = Tools::Resistors.new('Violet', 'Violet')
      expect(resistor.output).to eq(77)
    end

    it 'ignores more than two colors for input' do
      resistor = Tools::Resistors.new('Brown', 'Violet', 'Green')
      expect(resistor.output).to eq(17)
    end

    it 'ignores more than two colors for input' do
      resistor = Tools::Resistors.new('Orange', 'Blue', 'Black')
      expect(resistor.output).to eq(36)
    end

    it 'ignores Gold and Silver as input' do
      resistor = Tools::Resistors.new('Gold', 'Silver')
      expect(resistor.output).to eq(0)
    end
  end