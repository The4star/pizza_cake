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
        order_menu
    when 2
        puts("What is the order name you would like to ammend?")
        order_name = gets().chomp 
    when 3
    else
        puts("please make a valid selection")
    end
end

def order_menu()
    puts
    print("Please enter a name for the order:")
    customer_name = gets().chomp
    order_number = 0
    new_order = "Order#{order_number + 1}" 
    new_order = Orders::CustomerOrder.new(customer_name) 
    

    puts ("""
    You are working on order #{new_order.order_id} for #{new_order.customer_name}
    1.	Add a Pizza
    2.	Create a Custom Pizza
    3.	Add drinks
    4.	Add a note to order
    5.	Place/Update order
    """)    
end 

main_menu

