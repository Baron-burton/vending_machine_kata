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
    @coin_drawer.add(coins)
  end

  def load_coins(coins)
    @coin_drawer.add(coins)
  end

  def load_products(products)
    @inventory.add(products)
  end

  def list_products
    @inventory.list
  end

  def balance
    @coin_drawer.balance
  end

  def customer_balance
    customer_credit.balance
  end

  def order(product_name)
    if customer_balance_sufficient_for?(product_name)
      product = @inventory.retrieve(product_name)
      amount_owing = customer_credit.handle_payment(product.price)

      return product, handle_change(amount_owing)
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

    customer_balance && customer_balance >= product.price
  end

  def handle_change(amount_owing)
    if amount_owing > 0
      @coin_drawer.return_change(amount_owing)
    end
  end
end
