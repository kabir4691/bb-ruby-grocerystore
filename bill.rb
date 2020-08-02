class Bill

  attr_reader :total, :discount

  def initialize(total = 0, discount = 0)
    @total = total
    @discount = discount
  end

  def total_after_discount
    return total - discount
  end
end