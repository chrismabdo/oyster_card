class Oystercard

  attr_reader :balance, :in_journey
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey
  end

  def top_up(amount)
    fail "Limit of #{Oystercard::BALANCE_LIMIT} reached!" if limit(amount)
    @balance += amount
    @balance
  end

  def deduct(amount)
    @balance -= amount
    @balance
  end

  def touch_in
    fail "Not enough funds!" unless minimum_amount?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def limit(amount)
    amount + @balance > BALANCE_LIMIT
  end

  def minimum_amount?
    @balance >= MINIMUM_FARE

  end

end
