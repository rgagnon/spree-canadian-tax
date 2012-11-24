class Spree::Calculator::PrinceEdwardTax < Spree::Calculator 
  def self.description
    "Prince Edward Tax"
  end

  def self.register
    super
  end

  def compute(order)
    calculate_taxation(order.item_total)
  end

  private

  def calculate_taxation(total)
    gst = total * 0.05
    pst = (total + gst) * 0.1 #PST
    tax = round_to_two_places(gst + pst)
    return tax
  end

  def round_to_two_places(amount)
    BigDecimal.new(amount.to_s).round(2, BigDecimal::ROUND_HALF_UP)
  end
end
