module Custom

    class CustomPizza

        def initialize(number)
            @number = 0
            @base = base
            @ingredients = []
            @cost = 5
            @size = size
        end

        def add_base(base)
            @base = base.basename 
            @cost += basename.basecost
        end

        def add_extras(extra)
            @extras << extra.ingredientname
            @cost += extra.ingredientcost
        end
    end

    class Base

        attr_reader(:basename, :basecost)

        def initialize(basename, basecost)
            @basename = basename
            @basecost = basecost
        end
    
    end

    class Ingredient

        attr_reader(:ingredientname, :ingredientcost)
        
        def initialize(ingredientname, ingredientcost)
            @ingredientname = ingredientname
            @ingredientcost = 2
        end
    end
end

 #bases
 thin = Custom::Base.new("Thin", 0)
 deep_pan = Custom::Base.new("Deep Pan", 0)
 gluten_free = Custom::Base.new("Gluten Free", 2) 

 #ingredients
 pepperoni = Custom::Ingredient.new("Pepperoni")
 mushrooms = Custom::Ingredient.new("Mushrooms")
 cheese = Custom::Ingredient.new("Cheese")
 ham = Custom::Ingredient.new("Ham")
 pineapple = Custom::Ingredient.new("Pineapple")
 onion = Custom::Ingredient.new("Onion")
 bacon = Custom::Ingredient.new("Bacon")
 olives = Custom::Ingredient.new("Olives")
 capsicum = Custom::Ingredient.new("Capsicum")
 anchovi = Custom::Ingredient.new("Anchovi")
 prawns = Custom::Ingredient.new("Prawns")
 chicken = Custom::Ingredient.new("Chicken")
 eggs = Custom::Ingredient.new("Eggs")
 spinach = Custom::Ingredient.new("Spinach")
 basil = Custom::Ingredient.new("Basil")
