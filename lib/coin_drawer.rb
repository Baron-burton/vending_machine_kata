class CoinDrawer
  def initialize(coins = [])
    @coins = coins
  end

  def add(coins)
    @coins += coins
  end

  def balance
    @coins.sum
  end
end
