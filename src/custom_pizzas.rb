module Custom

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
            "#{@size} #{@base} custom pizza with #{@extras} for $#{@cost}"
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
        
        def initialize(ingredientname)
            @ingredientname = ingredientname
            @ingredientcost = 2
        end
    end

     #bases
     BASES = [
        thin = Base.new("Thin", 0),
        deep_pan = Base.new("Deep Pan", 0),
        gluten_free = Base.new("Gluten Free", 2)]

        #ingredients
    INGREDIENTS = [
        pepperoni = Ingredient.new("Pepperoni"),
        mushrooms = Ingredient.new("Mushrooms"),
        cheese = Ingredient.new("Cheese"),
        ham = Ingredient.new("Ham"),
        pineapple = Ingredient.new("Pineapple"),
        onion = Ingredient.new("Onion"),
        bacon = Ingredient.new("Bacon"),
        olives = Ingredient.new("Olives"),
        capsicum = Ingredient.new("Capsicum"),
        anchovi = Ingredient.new("Anchovi"),
        prawns = Ingredient.new("Prawns"),
        chicken = Ingredient.new("Chicken"),
        eggs = Ingredient.new("Eggs"),
        spinach = Ingredient.new("Spinach"),
        basil = Ingredient.new("Basil")]
end
