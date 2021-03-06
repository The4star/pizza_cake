require_relative './drinks.rb'
require_relative './pizzas.rb'
require_relative './orders.rb'
require 'artii'
require 'colorize'


def main_menu()
    a = Artii::Base.new :font => 'starwars'
    puts a.asciify('Pizza Cake') 
    puts ("version 1.0".colorize(:blue))
    
    puts("What would you like to do? \n1. Create a new order\n2. Ammend an existing order \n3. Exit Application")
        user_choice = gets().chomp.to_i
        
    case user_choice
    when 1
        get_customer_name()
    when 2
        if (Orders::ORDERS_FOR_TODAY.length <= 0)
            puts("You have not placed any orders yet".colorize(:red))
            puts
            main_menu()
        else
            puts
            puts ("Current orders for today:".colorize(:blue))
            puts
            Orders::ORDERS_FOR_TODAY.each do |value|
                puts value.customer_name
            end
            puts
            puts("What is the order name you would like to ammend?".colorize(:blue))
            order_name = gets().chomp
            Orders::ORDERS_FOR_TODAY.each do |value|
               if (value.customer_name.include?(order_name.capitalize))
                  Orders::ORDERS_FOR_TODAY.delete(value)
                  order_menu(value)
               end
            end
            puts
            puts("Sorry, that order does not exist".colorize(:red))
            puts
            main_menu
        end 
    when 3
        exit
    else
        puts("please make a valid selection".colorize(:red))
    end
end

def get_customer_name()
    puts
    print("Please enter a name for the order: ".colorize(:blue))
    customer_name = gets().chomp.capitalize 
    puts
    order_number = 0
    new_order = "order#{order_number + 1}" 
    new_order = Orders::CustomerOrder.new(customer_name)

    order_menu(new_order) 
end

def order_status(customer)
    puts("Order so far as of #{customer.time}:")
    puts
    puts ("Pizzas:")
    customer.pizza_string
    puts
    puts ("Custom Pizzas:") 
    customer.custom_pizza_string
    puts
    puts ("Drinks:")
    customer.drinks_string 
    puts
    puts ("Order notes: #{customer.order_notes} \n\nTotal for order: $#{customer.order_total}")  
end

def order_menu(customer) 

    order_status(customer)

    puts ("""
    You are working on order #{customer.order_id} for #{customer.customer_name}

    1.	Add a Pizza
    2.	Create a Custom Pizza
    3.	Add drinks
    4.	Add a note to order
    5.	Remove an item
    6.  Place/Update Order
    """)    

    order_choice = gets().chomp.to_i

    while (order_choice != 1 or order_choice != 2 or  order_choice != 3 or order_choice != 4 or order_choice != 5 or order_choice != 6)
        case order_choice
        when 1
            add_premade_pizza(customer)
        when 2
            choose_custom_pizza(customer)
        when 3
            choose_a_drink(customer)
        when 4
            puts("Please leave a message for your order below eg(no onion, allergic to peanuts):".colorize(:blue))
            customer.order_notes = gets().chomp
            order_menu(customer)
        when 5
            remove_item(customer)
        when 6
            if (customer.premadepizzas.length <= 0 and customer.custompizzas.length <= 0 and customer.drinksordered.length <= 0)
                puts("You need to order something first!".colorize(:red))
                puts
                order_menu(customer)
            else
                puts
                puts ("""Your order has been placed as follows:".colorize(:green))
                puts
                order_status(customer)
                
                Orders::ORDERS_FOR_TODAY << customer
                puts

                puts("Would you like to do anything else? \n1. Yes \n2. No".colorize(:blue))
                another_order = gets().chomp.to_i

                case (another_order)
                when 1 
                    main_menu()
                when 2
                    exit
                else
                    puts("please make a valid selection".colorize(:red))
                    puts("Would you like to make another order? \n1. Yes \n2. No".colorize(:blue))
                another_order = gets().chomp.to_i
                end
            end
        else
            puts("please make a valid selection".colorize(:red))
            puts
            order_status(customer)

            puts ("""
            You are working on order #{customer.order_id} for #{customer.customer_name}
        
            1.	Add a Pizza
            2.	Create a Custom Pizza
            3.	Add drinks
            4.	Add a note to order
            5.	Remove an item
            6.  Place/Update Order
            """)   
            order_choice = gets().chomp.to_i
        end
    end
end 

#The process for ordering a premade pizza
def add_premade_pizza(customerorder)
    chosen_pizza_number = 0
    chosen_pizza = "custom#{chosen_pizza_number + 1}" 
    chosen_pizza = Pizzas::Pizza.new()
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What Pizza would you like?
    1.	Hawaiian $11
    2.	Meat lovers $13
    3.	Margherita $10
    4.	BBQ Chicken $11
    5.	Vegetarian $11
    6.	Capricciosa $11
    """)
    pizza_choice = gets().chomp.to_i
    
    while (pizza_choice != 1 or pizza_choice != 2 or  pizza_choice != 3 or pizza_choice != 4 or pizza_choice != 5 or pizza_choice != 6)
        case pizza_choice
        when 1
            chosen_pizza.name =  "Hawaiian"
            chosen_pizza.cost = 11
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        when 2
            chosen_pizza.name = "Meatlovers"
            chosen_pizza.cost = 13
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        when 3
            chosen_pizza.name = "Margherita"
            chosen_pizza.cost = 10
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        when 4
            chosen_pizza.name = "BBQ Chicken"
            chosen_pizza.cost = 11
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        when 5
            chosen_pizza.name = "Vegetarian"
            chosen_pizza.cost = 11
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        when 6
            chosen_pizza.name = "Capricciosa"
            chosen_pizza.cost = 11
            puts
            puts("You added a #{chosen_pizza.name} pizza for $#{chosen_pizza.cost}".colorize(:green))
            break
        else
            puts("please make a valid selection".colorize(:red))
            
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

            What Pizza would you like?
            1.	Hawaiian $#{Pizzas::PIZZAS[0].cost}
            2.	Meat lovers $#{Pizzas::PIZZAS[1].cost}
            3.	Margherita $#{Pizzas::PIZZAS[2].cost}
            4.	BBQ Chicken $#{Pizzas::PIZZAS[3].cost}
            5.	Vegetarian $#{Pizzas::PIZZAS[4].cost}
            6.	Capricciosa $#{Pizzas::PIZZAS[5].cost}
            """)
            pizza_choice = gets().chomp.to_i
        end
    end
    
    
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    Order total: $#{chosen_pizza.cost}

    What base would you like?
    1. Thin
    2. Deep Pan
    3. Gluten Free ($2 extra)
    """)
    base_choice = gets().chomp.to_i

    while (base_choice != 1 or base_choice != 2 or  base_choice != 3)
        case base_choice
        when 1
            chosen_pizza.add_base(Pizzas::BASES[0])
            puts
            puts("You chose a Thin Base".colorize(:green))
            break
        when 2 
            chosen_pizza.add_base(Pizzas::BASES[1])
            puts
            puts("You chose a Deep Pan Base".colorize(:green))
            break
        when 3
            chosen_pizza.add_base(Pizzas::BASES[2])
            puts
            puts("You chose a Gluten Free Base".colorize(:green))
            break
        else
            puts("please make a valid selection".colorize(:green))
            puts
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

            Order total: $#{chosen_pizza.cost}

            What base would you like?
            1. Thin
            2. Deep Pan
            3. Gluten Free ($2 extra)
            """)
            base_choice = gets().chomp.to_i
        end
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    Order total: $#{chosen_pizza.cost}
    
    What Size would you like?
    1. Small
    2. Medium ($5 Extra)
    3. Large ($8 Extra)
    """)
    size_choice = gets().chomp.to_i

    while (size_choice != 1 or size_choice != 2 or  size_choice != 3)
        case size_choice
        when 1
            chosen_pizza.size = "Small"
            puts("You chose a Small Pizza".colorize(:green))
            break
        when 2 
            chosen_pizza.size = "Medium"
            chosen_pizza.cost += 5
            puts("You chose a Medium Pizza".colorize(:green))
            break
        when 3
            chosen_pizza.size = "Large"
            chosen_pizza.cost += 8
            puts("You chose a Large Pizza".colorize(:green))
            break
        else
            puts("please make a valid selection".colorize(:red))
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

            Order total: $#{chosen_pizza.cost}
            
            What Size would you like?
            1. Small
            2. Medium ($5 Extra)
            3. Large ($8 Extra)
            """)
            size_choice = gets().chomp.to_i
        end
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    Order total: $#{chosen_pizza.cost}
    
    What Extra Toppings would you like, all extras are $2?
    1.	Pepperoni
    2.	Mushrooms
    3.	Cheese
    4.	Ham
    5.	Pineapple
    6.	Onion
    7.	Bacon
    8.	Olives
    9.	Peppers
    10.	Anchovies
    11.	Prawns
    12.	Chicken
    13.	Egg
    14.	Spinach
    15.	Basil
    16.	Tomato Sauce
    17.	BBQ Sauce
    18.	Delete Last Item
    19.	Done
    """)
    extra_choice = gets().chomp.to_i
    extra_cost = 0
    while (extra_choice != 19)
        case extra_choice
        when 1
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[0])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 2
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[1])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 3
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[2])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 4
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[3])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 5
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[4])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 6
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[5])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 7
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[6])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 8
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[7])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 9
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[8])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 10
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[9])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 11
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[10])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 12
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[11])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 13
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[12])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 14
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[13])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 15
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[14])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 16
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[15])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 17
            chosen_pizza.add_extras(Pizzas::INGREDIENTS[16])
            puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
            puts
        when 18
            if (chosen_pizza.extras.length <= 0)
                puts("You need to add an extra first".colorize(:red))
            else 
                chosen_pizza.extras.pop
                chosen_pizza.cost -= 2
                puts("You're chosen extras: #{chosen_pizza.extras}\n Order total: $#{chosen_pizza.cost}")
                puts
            end
        else
            puts("please make a valid selection".colorize(:red))
        end
        puts ("""
        You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
        
        What Other Extra Toppings would you like, all extras are $2?
        1.	Pepperoni
        2.	Mushrooms
        3.	Cheese
        4.	Ham
        5.	Pineapple
        6.	Onion
        7.	Bacon
        8.	Olives
        9.	Peppers
        10.	Anchovies
        11.	Prawns
        12.	Chicken
        13.	Egg
        14.	Spinach
        15.	Basil
        16.	Tomato Sauce
        17.	BBQ Sauce
        18.	Delete Last Item
        19.	Done
    
        """)
        extra_choice = gets().chomp.to_i
    end

    customerorder.add_premadepizzas(chosen_pizza)
    puts
    puts("You ordered a #{chosen_pizza}".colorize(:green))
    puts
    order_menu(customerorder)
end

#The process to order a custom designed pizza
def choose_custom_pizza(customerorder)
    custom_pizza_number = 0
    new_custom_pizza = "custom#{custom_pizza_number + 1}" 
    new_custom_pizza = Pizzas::CustomPizza.new()
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What base would you like?
    1. Thin
    2. Deep Pan
    3. Gluten Free($2 extra)
    """)
    base_choice = gets().chomp.to_i

    while (base_choice != 1 or base_choice != 2 or  base_choice != 3)
        case base_choice
        when 1
            new_custom_pizza.add_base(Pizzas::BASES[0])
            puts
            puts("You chose a Thin Base".colorize(:green))
            break
        when 2 
            new_custom_pizza.add_base(Pizzas::BASES[1])
            puts
            puts("You chose a Deep Pan Base".colorize(:green))
            break
        when 3
            new_custom_pizza.add_base(Pizzas::BASES[2])
            puts("You chose a Gluten Free Base".colorize(:green))
            puts
            break
        else
            puts("please make a valid selection".colorize(:red))
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
        
            What base would you like?
            1. Thin
            2. Deep Pan
            3. Gluten Free($2 extra)
            """)
            base_choice = gets().chomp.to_i
        end
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
    
    Order total: $#{new_custom_pizza.cost}

    What Size would you like?
    1. Small
    2. Medium ($2 Extra)
    3. Large ($4 Extra)
    """)
    size_choice = gets().chomp.to_i

    while (size_choice != 1 or size_choice != 2 or  size_choice != 3)
        case size_choice
        when 1
            new_custom_pizza.size = "Small"
            puts
            puts("You chose a Small Pizza".colorize(:green))
            break
        when 2 
            new_custom_pizza.size = "Medium"
            new_custom_pizza.cost += 2
            puts
            puts("You chose a Medium Pizza".colorize(:green))
            break
        when 3
            new_custom_pizza.size = "Large"
            new_custom_pizza.cost += 4
            puts
            puts("You chose a Large Pizza".colorize(:green))
            break
        else
            puts("please make a valid selection".colorize(:red))
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
            
            Order total: $#{new_custom_pizza.cost}

            What Size would you like?
            1. Small
            2. Medium ($2 Extra)
            3. Large ($4 Extra)
            """)
            size_choice = gets().chomp.to_i
        end
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    Order total: $#{new_custom_pizza.cost}
    
    What Extra Toppings would you like, all extras are $2?
    1.	Pepperoni
    2.	Mushrooms
    3.	Cheese
    4.	Ham
    5.	Pineapple
    6.	Onion
    7.	Bacon
    8.	Olives
    9.	Peppers
    10.	Anchovies
    11.	Prawns
    12.	Chicken
    13.	Egg
    14.	Spinach
    15.	Basil
    16.	Tomato Sauce
    17.	BBQ Sauce
    18.	Delete Last Item
    19.	Done
    """)
    topping_choice = gets().chomp.to_i

    while (topping_choice != 19)
        case topping_choice
        when 1
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[0])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 2
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[1])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 3
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[2])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 4
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[3])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 5
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[4])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 6
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[5])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 7
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[6])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 8
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[7])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 9
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[8])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 10
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[9])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 11
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[10])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 12
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[11])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 13
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[12])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 14
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[13])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 15
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[14])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 16
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[15])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 17
            new_custom_pizza.add_toppings(Pizzas::INGREDIENTS[16])
            puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
            puts
        when 18
            if (new_custom_pizza.toppings.length <= 0)
                puts("You need to add a topping first".colorize(:red))
            else 
                new_custom_pizza.toppings.pop
                new_custom_pizza.cost -= 2
                puts("You're chosen extras: #{new_custom_pizza.toppings}\n Order total: $#{new_custom_pizza.cost}")
                puts
            end
        else
            puts("please make a valid selection".colorize(:red))
        end
        puts ("""
        You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
        
        What Other Extra Toppings would you like, all extras are $2?
        1.	Pepperoni
        2.	Mushrooms
        3.	Cheese
        4.	Ham
        5.	Pineapple
        6.	Onion
        7.	Bacon
        8.	Olives
        9.	Peppers
        10.	Anchovies
        11.	Prawns
        12.	Chicken
        13.	Egg
        14.	Spinach
        15.	Basil
        16.	Tomato Sauce
        17.	BBQ Sauce
        18.	Delete Last Item
        19.	Done
    
        """)
        topping_choice = gets().chomp.to_i
    end

    customerorder.add_custompizzas(new_custom_pizza)
    puts
    puts("You ordered a #{new_custom_pizza}".colorize(:green))
    puts
    order_menu(customerorder)
end


#The process for ordering drinks
def choose_a_drink(customerorder)
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What Drink would you like to add? All Drinks are $2
    1.	Coke
    2.	Sprite
    3.	Fanta
    4.	Lift
    5.	Water
    6.	None/Cancel

    """)
    drink_choice = gets().chomp().to_i

    while (drink_choice != 1 or drink_choice != 2 or drink_choice != 3 or drink_choice != 4 or drink_choice != 5 or drink_choice != 6)
        case drink_choice
        when 1
            customerorder.add_drinks(Drinks::DRINKSAVAILABLE[0])
            puts("You ordered a #{Drinks::DRINKSAVAILABLE[0].name}".colorize(:green))
            break
        when 2
            customerorder.add_drinks(Drinks::DRINKSAVAILABLE[1])
            puts("You ordered a #{Drinks::DRINKSAVAILABLE[1].name}".colorize(:green))
            break
        when 3
            customerorder.add_drinks(Drinks::DRINKSAVAILABLE[2])
            puts("You ordered a #{Drinks::DRINKSAVAILABLE[2].name}".colorize(:green))
            break
        when 4
            customerorder.add_drinks(Drinks::DRINKSAVAILABLE[3])
            puts("You ordered a #{Drinks::DRINKSAVAILABLE[3].name}".colorize(:green))
            break
        when 5
            customerorder.add_drinks(Drinks::DRINKSAVAILABLE[4])
            puts("You ordered a #{Drinks::DRINKSAVAILABLE[4].name}".colorize(:green))
            break
        when 6
            order_menu(customerorder)
        else
            puts("please make a valid selection".colorize(:red))
            puts ("""
            You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
    
            What Drink would you like to add? All Drinks are $2
            1.	Coke
            2.	Sprite
            3.	Fanta
            4.	Lift
            5.	Water
            6.	None/Cancel
    
            """)
            drink_choice = gets().chomp().to_i
        end
    end
        order_menu(customerorder)
end

# Method for removing items
def remove_item(customerorder)

    order_status(customerorder)

    puts("""
    What would you like to remove? 
    1. Remove the last Pizza
    2. Remove the last Custom Pizza
    3. Remove the last drink
    4. Done
    """)

    removal_choice = gets().chomp.to_i
    while (removal_choice != 4)
        case (removal_choice)
        when 1
            if (customerorder.premadepizzas.length <= 0)
                puts
                puts("You need to order a pizza first".colorize(:red))
            else
                amount_to_remove = customerorder.premadepizzas.last.cost
                customerorder.premadepizzas.pop
                customerorder.order_total -= amount_to_remove
            end
        when 2
            if (customerorder.custompizzas.length <= 0)
                puts
                puts("You need to order a custom pizza first".colorize(:red))
            else
                amount_to_remove = customerorder.custompizzas.last.cost
                customerorder.custompizzas.pop
                customerorder.order_total -= amount_to_remove
            end
        when 3
            if (customerorder.drinksordered.length <= 0)
                puts
                puts("You need to order a drink first".colorize(:red))
            else
                amount_to_remove = customerorder.drinksordered.last.cost
                customerorder.drinksordered.pop
                customerorder.order_total -= amount_to_remove
            end
        else
            puts("please make a valid selection".colorize(:red))
        end
            
        order_status(customerorder)

        puts("""
        What else would you like to remove? 
        1. Remove the last Pizza
        2. Remove the last Custom Pizza
        3. Remove the last drink
        4. Done
        """)
        removal_choice = gets().chomp.to_i
    end
    order_menu(customerorder)
end

main_menu
