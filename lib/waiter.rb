class Waiter
attr_accessor :name, :yrs_experience

@@all = []

def initialize(name, exper)
  @name = name
  @yrs_experience = exper
  @@all << self
end

def self.all
  @@all
end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def best_tipper
    best_meal = meals.max {|m1, m2| m1.tip <=> m2.tip}
    best_meal.customer
  end

end