module Drinks

    class Drink 

        attr_accessor(:name, :cost)

        def initialize(name)
            @name = name
            @cost = 2
        end
    end
    
    DRINKSAVAILABLE = [
    coke = Drink.new("Coke"),
    sprite = Drink.new("Sprite"),
    fanta = Drink.new("Fanta"),
    lift = Drink.new("Lift"),
    water = Drink.new("Water")]
end


