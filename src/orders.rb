require_relative './drinks.rb'
require_relative './pizzas.rb'


module Orders

    class CustomerOrder
        attr_accessor(:order_id, :order_notes,  :customer_name, :time, :premadepizzas, :custompizzas, :drinksordered, :order_total)

        def initialize(customer_name)
            create_order_id = Random.new
            @order_id = create_order_id.rand(1000..2000)
            @customer_name = customer_name
            @time = Time.now
            @premadepizzas = []
            @custompizzas = []
            @drinksordered = []
            @order_notes = order_notes
            @order_total = 0
        end

        def add_premadepizzas(pizza)
            @premadepizzas << pizza
            @order_total += pizza.cost
        end

        def add_custompizzas(custompizza)
            @custompizzas << custompizza
            @order_total += custompizza.cost
        end

        def add_drinks(drink)
            @drinksordered << drink 
            @order_total += drink.cost
        end

        def pizza_string()
            @premadepizzas.each do |pizza|
                puts("1 #{pizza.size} #{pizza.base} #{pizza.name} with extra #{pizza.extras} for $#{pizza.cost}")
            end
        end

        def custom_pizza_string()
            @custompizzas.each do |pizza|
                puts("1 #{pizza.size} #{pizza.base} custom made pizza with #{pizza.toppings} for $#{pizza.cost}")
            end
        end

        def drinks_string()
            @drinksordered.each do |drink|
                puts("1 #{drink.name}")
            end
        end
    end
    ORDERS_FOR_TODAY =[]
end
    
    