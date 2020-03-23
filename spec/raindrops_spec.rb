RSpec.describe Tools::Raindrops do

  it "checks if the number has 3 as a factor" do
    broj = Tools::Raindrops.new(33)
    expect(broj.faktor).to eq("Pling")
  end
  it "checks if the number has 5 as a factor" do
    broj = Tools::Raindrops.new(55)
    expect(broj.faktor).to eq("Plang")
  end
  it "checks if the number has 7 as a factor" do
    broj = Tools::Raindrops.new(77)
    expect(broj.faktor).to eq("Plong")
  end
  it "checks if the number has 3 and 5 as a factors" do
    broj = Tools::Raindrops.new(30)
    expect(broj.faktor).to eq("PlingPlang")
  end
  it "checks if the number doesn't have 3,5,7 as a factors" do
    broj = Tools::Raindrops.new(34)
    expect(broj.faktor).to eq("34")
  end

end