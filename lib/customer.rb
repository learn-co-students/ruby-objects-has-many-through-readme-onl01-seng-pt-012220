require 'pry'
class Customer
  
  attr_reader :name, :age, :meal, :waiter 
  
  @@all = []
  
  def initialize(name, age)
    @name = name 
    @age = age
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def new_meal(waiter,total,tip=0)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select {|m| m.customer == self}
  end 
  
  def waiters
    meals.map do |m|
    m.waiter
    end
  end
  
  
end