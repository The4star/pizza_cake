module Pizzas

    class Pizza

        attr_accessor(:name, :size, :cost, :base, :extras)
        
        def initialize()
            @name = name
            @size = size
            @cost = cost
            @base = base
            @extras = []
        end

        def add_base(base)
            @base = base.basename 
            @cost += base.basecost
        end

        def add_extras(extra)
            @extras << extra.ingredientname
            @cost += extra.ingredientcost
        end
        def to_s()
            "#{@size} #{@base} #{@name} with extra #{@extras} for $#{@cost}"
        end
    end

    class CustomPizza
        attr_accessor(:base, :ingredients, :cost, :size, :toppings)
            def initialize()
                @base = base
                @ingredients = []
                @toppings = []
                @cost = 5
                @size = size
            end
    
            def add_base(base)
                @base = base.basename 
                @cost += base.basecost
            end
    
            def add_toppings(topping)
                @toppings << topping.ingredientname
                @cost += topping.ingredientcost
            end
            def to_s()
                "#{@size} #{@base} custom pizza with #{@toppings} for $#{@cost}"
            end
        end

    class Base

        attr_reader(:basename, :basecost)

        def initialize(basename, basecost)
            @basename = basename
            @basecost = basecost
        end
    
    end

    class ExtraIngredient

        attr_accessor(:ingredientname, :ingredientcost)
        
        def initialize(ingredientname)
            @ingredientname = ingredientname
            @ingredientcost = 2
        end
    end

    #Pizzas
    # PIZZAS = [
    # hawaiian = Pizza.new("Hawaiian", 11),
    # meatlovers = Pizza.new("Meatlovers", 13),
    # margherita = Pizza.new("Margherita", 10),
    # bbqchicken = Pizza.new("BBQ Chicken", 11),
    # aussie = Pizza.new("Vegetarian", 11),
    # capricciosa = Pizza.new("Capricciosa", 11)]
    
    #Bases
    BASES = [
    thin = Base.new("Thin", 0),
    deep_pan = Base.new("Deep Pan", 0),
    gluten_free = Base.new("Gluten Free", 2)]

    #Ingredients
    INGREDIENTS = [
    pepperoni = ExtraIngredient.new("Pepperoni"),
    mushrooms = ExtraIngredient.new("Mushrooms"),
    cheese = ExtraIngredient.new("Cheese"),
    ham = ExtraIngredient.new("Ham"),
    pineapple = ExtraIngredient.new("Pineapple"),
    onion = ExtraIngredient.new("Onion"),
    bacon = ExtraIngredient.new("Bacon"),
    olives = ExtraIngredient.new("Olives"),
    capsicum = ExtraIngredient.new("Capsicum"),
    anchovi = ExtraIngredient.new("Anchovi"),
    prawns = ExtraIngredient.new("Prawns"),
    chicken = ExtraIngredient.new("Chicken"),
    eggs = ExtraIngredient.new("Eggs"),
    spinach = ExtraIngredient.new("Spinach"),
    basil = ExtraIngredient.new("Basil"),
    tomatosauce = ExtraIngredient.new("Tomato Sauce"),
    bbqsauce = ExtraIngredient.new("BBQ Sauce")]
end
