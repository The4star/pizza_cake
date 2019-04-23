module PreMadePizzas

    class Pizza

        attr_accessor(:size, :cost, :base, :extras)
        attr_reader(:name)
        def initialize(name, cost)
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
            "#{@size} #{@base} #{@name} with #{@extras} for $#{@cost}"
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

        attr_reader(:ingredientname, :ingredientcost)
        
        def initialize(ingredientname)
            @ingredientname = ingredientname
            @ingredientcost = 2
        end
    end
    #Pizzas
    PIZZAS = [
    hawaiian = PreMadePizzas::Pizza.new("Hawaiian", 11),
    meatlovers = PreMadePizzas::Pizza.new("Meatlovers", 13),
    margherita = PreMadePizzas::Pizza.new("Margherita", 10),
    bbqchicken = PreMadePizzas::Pizza.new("BBQ Chicken", 11),
    aussie = PreMadePizzas::Pizza.new("Aussie", 11),
    capricciosa = PreMadePizzas::Pizza.new("Capricciosa", 11)]
    
    #Bases
    BASES = [
    thin = PreMadePizzas::Base.new("Thin", 0),
    deep_pan = PreMadePizzas::Base.new("Deep Pan", 0),
    gluten_free = PreMadePizzas::Base.new("Gluten Free", 2)]

    #Ingredients
    INGREDIENTS= [
    pepperoni = PreMadePizzas::ExtraIngredient.new("Pepperoni"),
    mushrooms = PreMadePizzas::ExtraIngredient.new("Mushrooms"),
    cheese = PreMadePizzas::ExtraIngredient.new("Cheese"),
    ham = PreMadePizzas::ExtraIngredient.new("Ham"),
    pineapple = PreMadePizzas::ExtraIngredient.new("Pineapple"),
    onion = PreMadePizzas::ExtraIngredient.new("Onion"),
    bacon = PreMadePizzas::ExtraIngredient.new("Bacon"),
    olives = PreMadePizzas::ExtraIngredient.new("Olives"),
    capsicum = PreMadePizzas::ExtraIngredient.new("Capsicum"),
    anchovi = PreMadePizzas::ExtraIngredient.new("Anchovi"),
    prawns = PreMadePizzas::ExtraIngredient.new("Prawns"),
    chicken = PreMadePizzas::ExtraIngredient.new("Chicken"),
    eggs = PreMadePizzas::ExtraIngredient.new("Eggs"),
    spinach = PreMadePizzas::ExtraIngredient.new("Spinach"),
    basil = PreMadePizzas::ExtraIngredient.new("Basil")]
end
