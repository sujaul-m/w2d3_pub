class Customer

  attr_reader(:name, :wallet, :age, :drunkenness)

  def initialize(name, cash, age)
    @name = name
    @wallet = cash
    @drunkenness = 0
    @drinks = []
    @foods = []
    @age = age
  end

  def drink_count()
    return @drinks.count()
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def add_food(food)
    @foods.push(food)
  end

  def drunkenness_level
    return @drunkenness
  end

  def too_drunk
    if @drunkenness > 16
      return "To Drunk!"
    end
  end

  def increase_drunk_level(drink)
    @drunkenness += drink.alcohol
  end

  def decrease_drunk_level(food)
    @drunkenness -= food.rejuvenation_level
  end

  def decrease_wallet(amount)
    @wallet -= amount
  end

  def check_age
    if @age >= 18
      return @age
    else
      return "To Young!"
    end
  end

  def get_total_drunkenness()
    total = 0

    for alcohol in @drinks
      total += alcohol.alcohol
    end

    return total
  end

end
