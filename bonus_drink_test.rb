require 'minitest/autorun'
require './bonus_drink'

class BonusDrinkTest < Minitest::Test
  def test_buy_0
    assert_equal 0, BonusDrink.total_count_for(0)
  end

  def test_buy_1
    assert_equal 1, BonusDrink.total_count_for(1)
  end

  def test_buy_3
    assert_equal 4, BonusDrink.total_count_for(3)
  end

  def test_buy_11
    assert_equal 16, BonusDrink.total_count_for(11)
  end

  def test_buy_100
    assert_equal 149, BonusDrink.total_count_for(100)
  end
end
