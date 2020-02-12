require "pry"
class Customer
  attr_accessor :name, :age
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select{|meal| meal.customer == self}
  end

  def waiters
    list_of_waiters = []
    Meal.all.select{|meal|
      if meal.customer == self
        list_of_waiters << meal.waiter
      end
    }
    list_of_waiters
  end

end
