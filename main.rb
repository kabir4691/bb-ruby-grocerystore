require_relative 'constants'
require_relative 'cart'
require_relative 'grocery_item'

puts "Please enter all the items purchased separated by a comma"

input = gets.chomp
items = input.split(',')
items.each { |item| item.strip! }

if items.empty? 
  puts 'No items entered'
  abort
end

items.select! { |item| Constants::ITEM_NAMES.include?(item) }

if items.empty? 
  puts 'Please enter valid items'
  abort
end

cart = Cart.new
items.each { |item|
  grocery_item = nil
  case item
  when 'milk'
    grocery_item = GroceryItem.new('Milk', 3.97, 2, 5)
  when 'bread'
    grocery_item = GroceryItem.new('Bread', 2.17, 3, 6)
  when 'banana'
    grocery_item = GroceryItem.new('Banana', 0.99)
  when 'apple'
    grocery_item = GroceryItem.new('Apple', 0.89)
  end
  cart.add_item(grocery_item)
}

bill_amount = cart.bill_amount
puts "Total price: $#{bill_amount[1]}"
puts "You saved $#{(bill_amount[0] - bill_amount[1]).round(2)} today"



