class GroceryItem
  attr_reader :name
  attr_reader :price
  attr_reader :sale_amount
  attr_reader :sale_price

  def initialize(name, price, sale_amount=nil, sale_price=nil)
    @name = name
    @price = price
    @sale_amount = sale_amount
    @sale_price = sale_price
  end
end