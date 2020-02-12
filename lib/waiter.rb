require "pry"
class Waiter
  attr_accessor :name, :years_of_experience
  @@all = []
  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    save
  end

  def save
    @@all << self
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

  def customers
    custies = []
    Meal.all.each do |meal|
      if meal.waiter == self
        custies << meal.customer
      end
    end
    custies
  end

  def best_tipper
    best = nil
    Meal.all.each do |meal|
      if best == nil
        best = meal
      elsif best.tip < meal.tip
        best = meal
      end
    end
    best.customer
  end

end
