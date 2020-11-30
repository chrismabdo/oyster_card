class Oystercard

  attr_reader :balance
  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Limit of #{Oystercard::BALANCE_LIMIT} reached!" if limit(amount)
    @balance += amount
    @balance
  end

  private

  def limit(amount)
    amount + @balance > BALANCE_LIMIT
  end

end