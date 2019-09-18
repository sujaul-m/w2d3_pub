require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')
require_relative('../customer.rb')

class PubTest < Minitest::Test

  def setup()
    @drink1 = Drink.new("Jack Daniels Tennessee Whiskey", 26, 4)
    @drink2 = Drink.new("Grey Goose Vodka", 39, 8)

    @food1 = Food.new("Roast Chicken", 15, 10)
    @food2 = Food.new("Baked Potatoe", 5, 4)


    @drinks = [@drink1, @drink2]
    @foods = [@food1, @food2]

    @pub = Pub.new("E34", 1000.00, @drinks, @foods)
  end

  def test_pub_has_name()
    assert_equal("E34", @pub.name)
  end

  def test_pub_cash()
    assert_equal(1000, @pub.total_cash)
  end

  def test_pub_drink_count()
    assert_equal(2, @pub.drink_count())
  end

  def test_increase_drinks_sold()
    @pub.increase_drinks_sold()
    assert_equal(1, @pub.drinks_sold)
  end

  def test_can_increase_total_cash()
    @pub.increase_total_cash(500)
    assert_equal(1500, @pub.total_cash)
  end

  def test_can_find_by_name()
    drink = @pub.find_drink_by_name("Grey Goose Vodka")
    assert_equal("Grey Goose Vodka", drink.name)
  end

  def test_customer_of_age_can_buy_drink()
    customer = Customer.new("Vin Diesel", 10000, 18)
    @pub.sell_drink_to_customer(@drink2, customer)
    assert_equal(1, customer.drink_count())
    assert_equal(9961, customer.wallet)
    assert_equal(8, customer.get_total_drunkenness)
    assert_equal(1, @pub.drinks_sold)
    assert_equal(1039, @pub.total_cash)
    assert_equal(8, customer.drunkenness)
  end

  def test_customer_underaged_cant_buy_drink()
    customer = Customer.new("Vin Diesel", 10000, 17)
    @pub.sell_drink_to_customer(@drink2, customer)
    assert_equal("To Young!", customer.check_age())
  end

  def test_customer_of_age_can_buy_2_drinks()
    customer = Customer.new("Vin Diesel", 100, 18)
    @pub.sell_drink_to_customer(@drink2, customer)
    @pub.sell_drink_to_customer(@drink2, customer)
    assert_equal(2, customer.drink_count())
    assert_equal(22, customer.wallet)
    assert_equal(16, customer.get_total_drunkenness)
    assert_equal(2, @pub.drinks_sold)
    assert_equal(1078, @pub.total_cash)
    assert_equal(16, customer.drunkenness)
  end

  def test_customer_of_age_too_drunk()
    customer = Customer.new("Vin Diesel", 100, 18)
    @pub.sell_drink_to_customer(@drink2, customer)
    @pub.sell_drink_to_customer(@drink2, customer)
    @pub.sell_drink_to_customer(@drink2, customer)
    assert_equal("To Drunk!", customer.too_drunk())
  end

  def test_customer_of_age_can_buy_drink_and_food()
    customer = Customer.new("Vin Diesel", 10000, 18)
    @pub.sell_drink_and_food_to_customer(@drink2, @food2, customer)
    assert_equal(1, customer.drink_count())
    assert_equal(9956, customer.wallet)
    assert_equal(8, customer.get_total_drunkenness)
    assert_equal(1, @pub.drinks_sold)
    assert_equal(1044, @pub.total_cash)
    assert_equal(4, customer.drunkenness)
  end

end
