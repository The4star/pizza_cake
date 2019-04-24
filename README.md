# Terminal App: Pizza Cake version 1.0
<!-- Pizza Shop point of sale app running in the Bash command line written in Ruby. -->

## Contributors
|[![Clinton Forster](./docs/clinton.jpg)] https://github.com/The4Star| 
[![Kristy Lake](./docs/kristy.jpg)] https://github.com/klps007|
|-----------|-----------|
| Clinton Forster | Kristy Lake |

### Link
https://github.com/The4star/pizza_cake

### Purpose
Made for potentional sale to Pizza Shops, "Pizza Cake" provides a quick and simple process for making, placing and storing multiple orders which can also be ammended after an order has been placed. Within Pizza Cake's current scope as a minimum viable product, its primary purpose for the user is a simple process for  ordering a premade pizza, building a custom pizza, ordering drinks,amending an order, placing the order and storing the order should it need to be recalled in the future.
 
#### Functionality

Based on user input, Pizza Cake will return the users order itemized including cost per item and total order cost.

Pizza Cake users can build there own pizza by selecting size, base type and adding their chosen toppings, this returns an updated total order cost and the items in the current order (updated after each selection).

Alternatively, users can select a premade pizza and add any additional toppings required.

Throughout the session users can review their order and the total cost at the top of the screen and have option to delete the last item added to the order.

### Dependencies
The only Ruby Gem used was Artii for the title, all the rest of the code has been written by the team. 


### Instructions for Use
To run Pizza Cake you will need to install Artii. To do this, enter the following into terminal: 

```ruby
$ gem install artii
``` 

Open Terminal or preferred console. To initialise program, locate the src folder and call: 

```ruby
$ ruby app.rb
```

Pizza cake will open and you are ready to start making orders! 

From the main menu, make a selection:
![title_screenshot](./docs/title_screen.png)

## Designing and Planning
### Brainstorming
Initial planning was carried out on paper as well as a user workflow drawn up in Microsoft Word.

![planning in action](./docs/paper_planning.jpg)

### Task Management
Trello was used in a minimalist way to designate tasks and to keep us on task as we worked through  making the program.

![trello](./docs/trello.png)

### User Journey/Workflow
A workflow was drawn up to help us know exactly how the app would run which made it alot easier to then make the program:
![pizza_cake_workflow](./docs/app_workflow_diagram.png) -->

### Project Plan & Timeline
The scope for Pizza Cake v1.0 initial build was two days. After planning and making up our workflow we then set about writing the code and testing the code until we were happy with the minimum viable product. We then created the readme file and a presentation for when we sell the product as well as testing the product to make sure our code was working according to the way we had planned.   
### Coding Process
1. We created the file system 
2. Seperate files were created and modules were made
3. Classes were added in the modules with attributes
4. Methods were added in the classes
5. Constants were added in the module
6. The main functioning/workflow of the app was coded
7. Stretch goals (storing orders for later use and ammending the orders) were coded

### Challenges
* Accessing objects within modules
* Making sure the app would continue to run unless the user chooses to exit 
* storing orders for later reference
* accessing orders so that you are able to ammend them.

### Future Enhancements
* Staff login
* Reporting features
* Access order history from previous days
* Cash out function
* Choose Delivery, pickup or dine in 
* If dine in be able to assign orders to a table
* allow the end user to change pricing of products
* and many more