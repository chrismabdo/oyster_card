require "oystercard"

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

  # it "should deduct balance by a specified amount" do
  #   subject.top_up(10)
  #   expect(subject.deduct(10)).to eq 0
  # end

  describe "#touch_in" do
    it "should confirm that the card has been touched in" do
      subject.top_up(1)
      subject.touch_in
      expect(subject.in_journey).to eq true
    end
  end

  describe "#touch_out" do
    it "should confirm that the card has been touched out" do
      subject.top_up(1)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
    it "should deduct the fair of the journey" do
      subject.top_up(1)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end
  end

  describe "#in_journey" do
    it "should check whether the card is in journey or not" do
      subject.top_up(1)
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#minimum_amount" do
    it "should raise an error unless the card contains the minimum amount" do
      expect { subject.touch_in }.to raise_error "Not enough funds!"
    end
  end
end
