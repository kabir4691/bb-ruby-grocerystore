class Cart

  def initialize
    @items = []
  end

  def add_item(grocery_item)
    @items << grocery_item
  end

  def bill_amount 
    @items.map { |item| item.price }.inject(:+)
  end
end