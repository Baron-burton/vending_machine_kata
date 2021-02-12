require_relative 'inventory'
require_relative 'coin_drawer'

class VendingMachine
  def initialize(products = [], coins = [])
    @inventory = Inventory.new(products)
    @coin_drawer = CoinDrawer.new(coins)
  end

  def insert_coins(coins)
    customer_credit.add(coins)
  end

  def balance
    @customer_credit.balance
  end

  private

  def customer_credit
    @customer_credit ||= CoinDrawer.new
  end
end
