class Spree::Calculator::QuebecTax < Spree::Calculator 
  def self.description
    "Quebec Tax"
  end

  def self.register
    super
  end

  def compute(order)
    calculate_taxation(order.item_total)
  end

  private

  def calculate_taxation(total)
    total = total + (total * 0.05) #TPS
    total = total + (total * 0.095) #TVQ
    total = round_to_two_places(total)
    return total
  end

  def round_to_two_places(amount)
    BigDecimal.new(amount.to_s).round(2, BigDecimal::ROUND_HALF_UP)
  end
end
