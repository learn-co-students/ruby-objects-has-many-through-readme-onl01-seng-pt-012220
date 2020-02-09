require ('pry')
class Waiter
  attr_reader :name, :age
  @@all

  def initialize(name, age)
    @name = name
    @age = age
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{|meal| meal.waiter == self}
  end

  def best_tipper
     best_tip = meals.map{|meal| meal.tip}.max
     meals.find{|meal| meal.tip == best_tip}.customer
  end
end
