require_relative './drinks.rb'
require_relative './premade_pizzas.rb'
require_relative './custom_pizzas.rb'

module Orders

    class CustomerOrder
        attr_accessor(:order_id, :customer_name, :time, :premadepizzas, :custompizzas, :drinks, :order_total)

        def initialize(customer_name)
            create_order_id = Random.new
            @order_id = create_order_id.rand(1000..2000)
            @customer_name = customer_name
            @time = Time.now
            @premadepizzas = []
            @custompizzas = []
            @drinks = []
            @order_total = 0
        end

            def add_premadepizzas(pizza)
                @premadepizzas << pizza
            end

            def add_custompizzas(custompizza)
                @custompizzas << custompizza
            end

            def add_drinks(drink)
                @drinks << drink 
            end
    end
end
    
    