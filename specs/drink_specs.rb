require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class TestDrink < Minitest::Test

  def setup()
    @drink1 = Drink.new("Jack Daniels Tennessee Whiskey", 26, 4)
    @drink2 = Drink.new("Grey Goose Vodka", 39, 8)
  end

  def test_drink1_has_name()
		assert_equal("Jack Daniels Tennessee Whiskey", @drink1.name)
	end

  def test_drink2_has_name()
		assert_equal("Grey Goose Vodka", @drink2.name)
	end

	def test_drink1_has_alcohol_level()
		assert_equal(4, @drink1.alcohol)
	end

  def test_drink2_has_alcohol_level()
    assert_equal(8, @drink2.alcohol)
  end

	def test_drink1_has_price()
		assert_equal(26, @drink1.price)
	end

  def test_drink2_has_price()
		assert_equal(39, @drink2.price)
	end

end
