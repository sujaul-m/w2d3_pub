class Pub

  attr_reader(:name, :total_cash, :drinks, :drinks_sold, :foods)

  def initialize(name, till, drinks, foods)
    @name = name
    @total_cash = till
    @drinks = drinks
    @foods = foods
    @drinks_sold = 0
  end

  def drink_count()
    return @drinks.count()
  end

  def increase_drinks_sold()
    @drinks_sold += 1
  end

  def increase_total_cash(amount)
    @total_cash += amount
  end

  def find_drink_by_name(name)
    for drink in @drinks
      if drink.name == name
        return drink
      end
    end
    return nil
  end

  def sell_drink_to_customer(drink, customer)
    if customer.age < 18
      return "To Young!"
    elsif customer.drunkenness_level > 16
      return "To Drunk!"
    else
      customer.add_drink(drink)
      customer.decrease_wallet(drink.price)
      customer.get_total_drunkenness()
      increase_drinks_sold()
      increase_total_cash(drink.price)
      customer.increase_drunk_level(drink)
    end
  end

  def sell_drink_and_food_to_customer(drink, food, customer)
    if customer.age < 18
      return "To Young!"
    elsif customer.drunkenness_level > 16
      return "To Drunk!"
    else
      customer.add_drink(drink)
      customer.add_food(food)
      customer.decrease_wallet(drink.price)
      customer.decrease_wallet(food.price)
      customer.get_total_drunkenness()
      increase_drinks_sold()
      increase_total_cash(drink.price)
      increase_total_cash(food.price)
      customer.increase_drunk_level(drink)
      customer.decrease_drunk_level(food)
    end
  end

end
