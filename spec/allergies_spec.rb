# frozen_string_literal: true

RSpec.describe Tools::Allergies do
  describe "determines weather or not they're allergic to a given item" do
    it 'matches the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.alergic_to?('eggs')).to be true
    end

    it "doesn't match the allergen with the score" do
      allergies = Tools::Allergies.new(1)
      expect(allergies.alergic_to?('peanuts')).to be false
    end

    it 'matches multiple allergens with the score' do
      allergies = Tools::Allergies.new(3)
      expect(allergies.alergic_to?('eggs')).to be true
      expect(allergies.alergic_to?('peanuts')).to be true
    end
  end
  it "tests that a person doesn't have allergies" do
    allergies = Tools::Allergies.new(0)
    expect(allergies.list_of_allergies).to be_empty
  end

  it 'tests that a person has many allergies' do
    allergies = Tools::Allergies.new(204)
    expect(allergies.list_of_allergies).to eq(%w[cats pollen strawberries shellfish])
  end

  it 'tests that a person has all the listed allergies' do
    allergies = Tools::Allergies.new(255)
    expect(allergies.list_of_allergies).to eq(%w[cats pollen chocolate tomatoes strawberries shellfish peanuts eggs])
  end
  it 'ignores allergens not listed' do
    allergies = Tools::Allergies.new(1248)
    expect(allergies.list_of_allergies).to eq(%w[cats pollen chocolate])
  end
end
