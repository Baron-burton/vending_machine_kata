require_relative 'inventory'
require_relative 'coin_drawer'

class VendingMachine
  def initialize(products = nil, coins = nil)
    @inventory = Inventory.new(products)
    @coin_drawer = CoinDrawer.new(coins)
  end
end
