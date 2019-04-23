module Drinks

    class Drink 

        attr_reader(:name, :cost)

        def initialize(name)
            @name = name
            @cost = 2
        end
    end
    DRINKS = [
        coke = Drinks::Drink.new("Coke"),
    sprite = Drinks::Drink.new("Sprite"),
    fanta = Drinks::Drink.new("Fanta"),
    lift = Drinks::Drink.new("Lift"),
    water = Drinks::Drink.new("Water")]
end


