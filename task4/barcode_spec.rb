require 'barcode'

describe "prop_barcode" do
  it "should return barcode as valid" do
    expect(prop_barcode("55123457", 1)).to eq "55123457"
  end

  it "should return barcode as valid" do
    expect(prop_barcode("5012345678900", 2)).to eq "5012345678900"
  end

  it "should raise error for too short EAN-13" do
    expect{prop_barcode("50123456789", 2)}.to raise_error(ArgumentError)
  end

  it "should raise error for too short EAN-8" do
    expect{prop_barcode("501234", 1)}.to raise_error(ArgumentError)
  end

  it "should raise error for invalid type" do
    expect{prop_barcode("5012345678900", 3)}.to raise_error(ArgumentError)
  end

  it "should raise error for invalid checksum" do
    expect{prop_barcode("5012345678902", 2)}.to raise_error(ArgumentError)
  end

  it "should raise error for invalid type" do
    expect{prop_barcode("5012345678900", 1)}.to raise_error(ArgumentError)
  end
end