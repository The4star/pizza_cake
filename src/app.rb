require_relative './drinks.rb'
require_relative './premade_pizzas.rb'
require_relative './custom_pizzas.rb'
require_relative './orders.rb'
require 'artii'


def main_menu()
    a = Artii::Base.new :font => 'starwars'
    puts a.asciify('Pizza Cake') 
    puts ("version 1.0")
    
    puts("What would you like to do? \n1. Create a new order\n2. Ammend an existing order \n3. Exit Application")
        user_choice = gets().chomp.to_i
        
    case user_choice
    when 1
        get_customer_name()
    when 2
        puts("What is the order name you would like to ammend?")
        order_name = gets().chomp 
    when 3
    else
        puts("please make a valid selection")
    end
end
def get_customer_name()
    puts
    print("Please enter a name for the order:")
    customer_name = gets().chomp
    order_number = 0
    new_order = "Order#{order_number + 1}" 
    new_order = Orders::CustomerOrder.new(customer_name)

    order_menu(new_order) 

end

def order_menu(customer)    
   puts customer
    puts ("""
    You are working on order #{customer.order_id} for #{customer.customer_name}

    1.	Add a Pizza
    2.	Create a Custom Pizza
    3.	Add drinks
    4.	Add a note to order
    5.	Place/Update order
    """)    

    order_choice = gets().chomp.to_i

    case order_choice
    when 1
        add_premade_pizza(customer)
    when 2
        choose_a_base_custom(customer)
    when 3
        choose_a_drink(customer)
    when 4
        puts("Please leave a message for your order below eg(no onion, allergic to peanuts):")
        customer.order_notes = gets().chomp
    when 5
        puts ("Your order has been placed")
    else
        puts("please make a valid selection")
    end
end 

def add_premade_pizza(customerorder)

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What Pizza would you like?
    1.	Hawaiian 
    2.	Meat lovers
    3.	Margherita
    4.	BBQ Chicken
    5.	Aussie
    6.	Capricciosa
    """)
    pizza_choice = gets().chomp.to_i
    
    case pizza_choice
    when 1
        chosen_pizza =  PreMadePizzas::PIZZAS[0]
    when 2
        chosen_pizza =  PreMadePizzas::PIZZAS[1]
    when 3
        chosen_pizza =  PreMadePizzas::PIZZAS[2]
    when 4
        chosen_pizza =  PreMadePizzas::PIZZAS[3]
    when 5
        chosen_pizza =  PreMadePizzas::PIZZAS[4]
    when 6
        chosen_pizza =  PreMadePizzas::PIZZAS[5]
    else
    puts("please make a valid selection")
    print customerorder
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What Pizza would you like?
    1.	Hawaiian 
    2.	Meat lovers
    3.	Margherita
    4.	BBQ Chicken
    5.	Aussie
    6.	Capricciosa
    """)
    pizza_choice = gets().chomp.to_i
    end
    
    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

    What base would you like?
    1. Thin
    2. Deep Pan
    3. Gluten Free($2 extra)
    """)
    base_choice = gets().chomp.to_i

    case base_choice
    when 1
        chosen_pizza.add_base(PreMadePizzas::BASES[0])
        puts("You chose a Thin Base")
    when 2 
        chosen_pizza.add_base(PreMadePizzas::BASES[1])
        puts("You chose a Deep Pan Base")
    when 3
        chosen_pizza.add_base(PreMadePizzas::BASES[2])
        puts("You chose a Gluten Free Base")
    else
        puts("please make a valid selection")
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
    
    What Size would you like?
    1. Small
    2. Medium
    3. Large
    """)
    size_choice = gets().chomp.to_i

    case size_choice
    when 1
        chosen_pizza.size = "Small"
    when 2 
        chosen_pizza.size = "Medium"
        chosen_pizza.cost += 5
    when 3
        chosen_pizza.size = "Large"
        chosen_pizza.cost += 8
    else
        puts("please make a valid selection")
    end

    puts ("""
    You are working on order #{customerorder.order_id} for #{customerorder.customer_name}
    
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
    18. Delete last item
    19.	Done
    """)
    extra_choice = gets().chomp.to_i

    while (extra_choice != 19)
        case extra_choice
        when 1
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[0])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 2
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[1])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 3
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[2])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 4
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[3])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 5
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[4])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 6
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[5])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 7
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[6])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 8
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[7])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 9
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[8])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 10
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[9])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 11
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[10])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 12
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[11])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 13
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[12])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 14
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[13])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 15
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[14])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 16
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[15])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 17
            chosen_pizza.add_extras(PreMadePizzas::INGREDIENTS[16])
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        when 18
            chosen_pizza.extras.pop
            puts("You're chosen extras: #{chosen_pizza.extras}")
            puts
        else
            puts("please make a valid selection")
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
        18. Delete last item
        19.	Done
    
        """)
        extra_choice = gets().chomp.to_i
    end

    customerorder.premadepizzas << chosen_pizza
    puts("You ordered a #{chosen_pizza}")

order_menu(customerorder)
end

choose_a_drink(customerorder)
puts ("""
You are working on order #{customerorder.order_id} for #{customerorder.customer_name}

What Drink would you like to add?
1.	Coke
2.	Sprite
3.	Fanta
4.	Lift
5.	Water
6.	None/Cancel

""")

main_menu