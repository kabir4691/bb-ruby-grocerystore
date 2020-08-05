require_relative 'bill'
require 'terminal-table/import'

class Cart

  def initialize
    @items = []
  end

  def add_item(grocery_item)
    @items << grocery_item
  end

  def bill
    return Bill.new if @items.empty? 

    total_amount = @items.map { |item| item.price }.inject(:+)
    items_group = @items.group_by { |item| item.name }
    discounted_amount = items_group.inject(0) { |total, (name, list)| 
      total += collection_bulk_price(list)
    }   

    return Bill.new(total_amount, total_amount - discounted_amount)
  end

  def to_table_string
    rows = []

    unless @items.empty?
      items_group = @items.group_by { |item| item.name }
      items_group.each { |name, list| 
        rows << [name, list.size, "$#{collection_bulk_price(list)}"]
      }
    end

    cart_table = table { |t|
      t.headings = "Item", "Quantity", "Price"
      rows.each { |row| t << row }
    }

    return cart_table.to_s
  end
  
  private

  def collection_bulk_price(collection)
    return 0 if (collection.nil? || collection.empty?)

    size = collection.size
    item = collection[0]
    return size * item.price if item.sale_amount.nil?
    
    quotient = size / item.sale_amount
    remainder = size % item.sale_amount
    return (quotient * item.sale_price) + (remainder * item.price)
  end
end