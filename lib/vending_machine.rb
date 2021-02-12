require_relative 'inventory'

class VendingMachine
  def initialize(products = nil)
    @inventory = Inventory.new(products)
  end
end
