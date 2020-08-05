require_relative 'validator'
require_relative 'cart'
require_relative 'grocery_item'
require_relative 'bill'

puts "Please enter all the items purchased separated by a comma"

input = gets.chomp
items = input.split(',')
items.each { |item| item.strip! }

if !Validator.validateInput(items) 
  abort
end

cart = Cart.new
items.each { |item|
  grocery_item = Constants::ITEM_MAPPINGS[item.to_sym]
  cart.add_item(grocery_item) unless grocery_item.nil?
}

puts "\n"
puts cart.to_table_string
puts "\n"

bill = cart.bill
puts "Total price: $#{bill.total_after_discount.round(2)}"
puts "You saved $#{(bill.discount).round(2)} today"



