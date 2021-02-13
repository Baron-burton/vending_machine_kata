require_relative 'inventory'
require_relative 'coin_drawer'

class InsufficientFunds < StandardError; end
class VendingMachine
  def initialize(products = [], coins = [])
    @inventory = Inventory.new(products)
    @coin_drawer = CoinDrawer.new(coins)
  end

  def insert_coins(coins)
    customer_credit.add(coins)
  end

  def load_coins(coins)
    @coin_drawer.add(coins)
  end

  def balance
    @coin_drawer.balance
  end

  def customer_balance
    customer_credit.balance
  end

  def order(product_name)
    if customer_balance_sufficient_for?(product_name)
      @inventory.retrieve(product_name)
    else
      raise InsufficientFunds.new('Please insert more coins')
    end
  end

  private

  def customer_credit
    @customer_credit ||= CoinDrawer.new
  end

  def customer_balance_sufficient_for?(product_name)
    product = @inventory.product_details(product_name)

    customer_balance >= product.price
  end
end
