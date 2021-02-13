class CoinDrawer
  def initialize(coins = [])
    @coins = coins
    @balance = coins.inject(0, :+)
  end

  def add(coins)
    @coins += coins
    @balance += coins.sum
  end

  def balance
    @balance
  end

  def handle_payment(price_to_pay)
    @balance -= price_to_pay
  end

  def return_change(amount_owing)
    if @coins.include?(amount_owing)
      [@coins.delete(amount_owing)]
    else
      @coins.sort.reverse.map.with_index do |coin, index|
        if (amount_owing - coin) >= 0
          amount_owing -= coin

          @coins.sort.reverse.delete_at(index)
        end
      end.compact
    end
  end
end
