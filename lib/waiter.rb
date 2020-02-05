class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
           meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end

    # def most_frequent_customer
    #     customers = []
    #     counts = Hash.new(0)
    #     customer_with_count = {} 
    #     meals.each do |meal|
    #         customers << meal.customer
    #     end
    #     customers.each{ |name| counts[name] += 1}
    #     most_freq = counts.key.max do |name_a, name_b|
    #         name_a.value <=> name_b.value
    #     end
    #     most_freq
    # end            
    def worst_tipper
        worst_tipped_meal = meals.min do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        worst_tipped_meal.customer
    end

    def self.all
      @@all
    end
   
end