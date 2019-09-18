require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test

  def setup()
    @drink1 = Drink.new("Jack Daniels Tennessee Whiskey", 26, 4)
    @drink2 = Drink.new("Grey Goose Vodka", 39, 8)
    @food1 = Food.new("Roast Chicken", 15, 10)
    @food2 = Food.new("Baked Potatoe", 5, 4)
    @customer1 = Customer.new("Vin Diesel", 10000, 18)
    @customer2 = Customer.new("Vin Diesel", 10000, 17)
  end

  def test_customer_has_name()
    assert_equal("Vin Diesel", @customer1.name)
  end

  def test_customer_has_cash()
    assert_equal(10000, @customer1.wallet)
  end

  def test_customer_drunkenness_starts_at_zero()
    assert_equal(0, @customer1.drunkenness_level())
  end

  def test_customers_had_zero_drinks
    assert_equal(0, @customer1.drink_count())
  end

  def test_customer_have_drink()
    @customer1.add_drink(@drink1)
    assert_equal(1, @customer1.drink_count())
  end

  def test_can_get_total_drunkenness()
    @customer1.add_drink(@drink1)
    @customer1.add_drink(@drink2)
    @customer1.add_drink(@drink1)
    assert_equal(16, @customer1.get_total_drunkenness())
  end

  def test_can_decrease_wallet()
    @customer1.decrease_wallet(39)
    assert_equal(9961, @customer1.wallet)
  end

  def test_check_age__customer_old_enough
    assert_equal(18, @customer1.age)
  end

  def test_check_age__customer_underaged
    assert_equal("To Young!", @customer2.check_age)
  end

  def test_increase_drunk_level
    @customer1.increase_drunk_level(@drink2)
    assert_equal(8, @customer1.drunkenness_level)
  end

  def test_food_reduces_drunkenness_level
    @customer1.increase_drunk_level(@drink2)
    @customer1.decrease_drunk_level(@food2)
    assert_equal(4, @customer1.drunkenness_level)
  end

end
