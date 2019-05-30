require 'task2'

describe "prop_date" do
  it "should check if date is correct" do
    expect(prop_date(2011, 1, 1)).to eq true
  end

  it "should return false with too many days" do
    expect(prop_date(2013, 12, 40)).to eq false
  end

  it "should return false with year above limit" do
    expect(prop_date(2109, 03, 10)).to eq false
  end

  it "should check if date is correct beeing a leap year" do
    expect(prop_date(2020, 2, 29)).to eq true
  end
end