require 'oystercard'

describe Oystercard do

  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "can be topped up by a custom amount" do
    expect(subject.top_up(5)).to eq 5
  end

end
