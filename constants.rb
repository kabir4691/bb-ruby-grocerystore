require_relative 'grocery_item'

module Constants

  ITEM_MAPPINGS = {
    milk: GroceryItem.new('Milk', 3.97, 2, 5),
    bread: GroceryItem.new('Bread', 2.17, 3, 6),
    banana: GroceryItem.new('Banana', 0.99),
    apple: GroceryItem.new('Apple', 0.89)
  }.freeze
end