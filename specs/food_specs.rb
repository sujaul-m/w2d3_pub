require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class TestFood < Minitest::Test

  def setup()
    @food1 = Food.new("Roast Chicken", 15, 10)
    @food2 = Food.new("Baked Potatoe", 5, 4)
  end

  def test_food1_has_name()
		assert_equal("Roast Chicken", @food1.name)
	end

  def test_food2_has_name()
		assert_equal("Baked Potatoe", @food2.name)
	end

	def test_food1_has_rejuvenation_level()
		assert_equal(10, @food1.rejuvenation_level)
	end

  def test_food2_has_rejuvenation_level()
    assert_equal(4, @food2.rejuvenation_level)
  end

	def test_food1_has_price()
		assert_equal(15, @food1.price)
	end

  def test_food2_has_price()
		assert_equal(5, @food2.price)
	end

end
