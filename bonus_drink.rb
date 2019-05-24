class BonusDrink
  def self.total_count_for(amount)
    amount >= 3 ? 3 + total_count_for(amount - 2) : amount
  end
end
