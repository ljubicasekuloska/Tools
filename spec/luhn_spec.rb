RSpec.describe Tools::Luhn do
  # let(:luhn_example) { Tools::Luhn.new('2') }

  it "doesn't allow single digit strings" do
    luhn_example = Tools::Luhn.new('3')
    expect(luhn_example.luhn_calc).to be false
  end

  it "doesn't allow an empty string" do
    luhn_example = Tools::Luhn.new('')
    expect(luhn_example.luhn_calc).to be false
  end

  it 'confirms that a single zero is invalid' do
    luhn_example = Tools::Luhn.new('0')
    expect(luhn_example.luhn_calc).to be false
  end

  it 'confirms that a simple valid sin remains valid if reversed' do
    # luhn_example = Tools::Luhn.new('059')
    # expect(luhn_example.valid?).to be true
    luhn_example = Tools::Luhn.new('950')
    expect(luhn_example.luhn_calc).to be true
  end

  it 'confirms that a simple valid sin becomes invalid if reversed' do
    # luhn_example = Tools::Luhn.new('1362')
    # expect(luhn_example.luhn_calc).to be true
    luhn_example = Tools::Luhn.new('2631')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks if it's a valid canadian sin" do
    luhn_example = Tools::Luhn.new('046 454 286')
    expect(luhn_example.luhn_calc).to be true
  end

  it "checks if it's an invalid canadian sin" do
    luhn_example = Tools::Luhn.new('046 454 287')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks if it's an invalid credit card" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that it's a valid number with an even number of digits" do
    luhn_example = Tools::Luhn.new('4539 1488 0343 6467')
    expect(luhn_example.luhn_calc).to be true
  end

  it "checks that valid strings with a non digit included become invalid" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0567d')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that valid strings with a non digit added at the end become invalid" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0567d')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that valid strings with punctuation included become invalid" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0567!')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that valid strings with symbols included become invalid" do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0567$')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that a single zero with space is invalid" do
    luhn_example = Tools::Luhn.new('0 ')
    expect(luhn_example.luhn_calc).to be false
  end

  it "checks that more than a single zero is valid" do
    luhn_example = Tools::Luhn.new('00')
    expect(luhn_example.luhn_calc).to be true
  end

  it "checks if input digit 9 is correctly converted to output digit 9" do
    luhn_example = Tools::Luhn.new('924 429 632')
    expect(luhn_example.luhn_calc).to be true
   # puts "Brojot e validen: #{luhn_example.niza.reverse}"
  end

  it "checks that strings with non digits is invalid" do
    luhn_example = Tools::Luhn.new('abcd efgh ijk@ #$%^')
    expect(luhn_example.luhn_calc).to be false
  end
end
