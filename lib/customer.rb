class Customer
  
    attr_accessor :name, :age, :years, :waiter, :meal
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        @@all << self

    end

    def self.all
        @@all
    end

    # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
    def new_meal(waiter, total,tip)
        Meal.new(waiter, self, total, tip)
    end

    # returns an Array of Meal instances associated with this customer
    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    #  returns an Array of Waiter instances associated with this customer's meals
    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end

end