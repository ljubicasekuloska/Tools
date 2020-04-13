RSpec.describe Tools::Chocolate do
  it "returns true if the total area of chocolate is the same for each person" do
    x = Tools::Chocolate.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(x.fairness?).to be true
  end
  it "returns true if the total area of chocolate is the same for each person" do
    x = Tools::Chocolate.new([[4, 5], [2, 4]], [[4, 2], [4, 2], [3, 1], [3, 3]])
    expect(x.fairness?).to be true
  end
  it "returns true if the total area of chocolate is the same for each person" do
    x = Tools::Chocolate.new([[4, 5]], [[5, 4]])
    expect(x.fairness?).to be true
  end
  it "returns false if the total area of chocolate is not the same for each person" do
    x = Tools::Chocolate.new([[4, 3], [2, 4], [1, 2]], [[6, 3], [4, 2], [1, 1], [1, 1]])
    expect(x.fairness?).to be false
  end
  it "returns false if the total area of chocolate is not the same for each person" do
    x = Tools::Chocolate.new([[4, 5], [2, 5]], [[4, 2], [4, 2], [3, 4], [3, 3]])
    expect(x.fairness?).to be false
  end
  it "returns false if the total area of chocolate is not the same for each person" do
    x = Tools::Chocolate.new([[4, 5]], [[4, 2]])
    expect(x.fairness?).to be false
  end
end