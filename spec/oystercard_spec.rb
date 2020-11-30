require 'oystercard'

describe Oystercard do
  it "starts with a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it "can be topped up by a custom amount" do
      expect(subject.top_up(5)).to eq 5
    end

    it "raises an error when balance exceeds limit" do
      expect { subject.top_up(91) }.to raise_error "Limit of #{Oystercard::BALANCE_LIMIT} reached!"
    end
  end
end
