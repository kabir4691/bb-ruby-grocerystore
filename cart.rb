class Cart

  def initialize
    @items = []
  end

  def add_item(grocery_item)
    @items << grocery_item
  end

  def bill_amount
    return [0, 0] if @items.empty? 

    total_amount = @items.map { |item| item.price }.inject(:+)
    items_group = @items.group_by { |item| item.name }
    discounted_amount = items_group.inject(0) { |total, (name, list)| 
      total += collection_bulk_price(list)
    }   

    [total_amount, discounted_amount]
  end

  def items_breakup
    return [] if @items.empty?

    result = []
    items_group = @items.group_by { |item| item.name }
    items_group.each { |name, list| 
      result << [name, list.size, "$#{collection_bulk_price(list)}"]
    }
    result
  end
  
  private

  def collection_bulk_price(collection)
    return 0 if (collection.nil? || collection.empty?)

    size = collection.size
    item = collection[0]
    return size * item.price if item.sale_amount.nil?
    
    quotient = size / item.sale_amount
    remainder = size % item.sale_amount
    (quotient * item.sale_price) + (remainder * item.price)
  end
end