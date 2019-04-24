# Terminal App: Pizza Cake version 1.0
<!-- Pizza Shop point of sale app running in the Bash command line written in Ruby. -->

## Contributors
|[![Clinton Forster](./docs/clinton.jpg)] https://github.com/The4Star| 
[![kristy lake](/assets/contributors-jmerrigan-70x70.jpg)] https://github.com/klps007|
|-----------|-----------|
| Clinton Forster | Kristy Lake |
<!-- 
### Link
https://github.com/The4star/pizza_cake

### Purpose
Made for potentional sale to Pizza Shops, Pizza cake provides a quick and simple process making, placing and storing the order details for furture refernce and reporting. Within Pizza Cake's current scope as a minimum viable product, its primary purpose for the user is a simple process for  ordering a premade pizza, building a custom pizza, amending an order, placing the order and storing the order should it need to be recalled in the future
 
#### Functionality

Based on user input, Pizza Cake will return the users order itemized including cost per item and total order cost.

Pizza Cake users can build there own pizza by selecting size, base type and adding there choosen toppings, this returns an updated total order cost and the items in the current order (updated after each selection)

Alternatively, users can select a premade pizza and add any additional topping required.

Throughout the session users can use review there order and the total cost at the top of the screen and have option to delete the last item added to the order.

### Dependencies
The Ruby gems 'tty-font', 'tts-spinner', 'net/http' and 'json' are required to run myMDb.


### Instructions for Use
Open Terminal or preferred console. To initialise program, enter:

```ruby
$ bundle install
```
This will install the following Ruby gems specified in the Gemfile:

'artii' <br> -->





```ruby
$ ruby main.rb
```
Ready to go! 

From the main menu, make a selection:
![main_menu_screenshot](assets/main_menu.png)

## Designing and Planning
### Brainstorming
<!-- Paper was used for initial freeform brainstorming and scope definition.  -->

![brainstorming1](assets/brainstorming1.jpg)
![brainstorming2](assets/brainstorming2.jpg)
![brainstorming3](assets/brainstorming3.jpg)
![brainstorming](assets/brainstorming4.jpg)

### Task Management
Trello allowed us to define the features, flow and logic for a minimum viable product, breakdown and itemise current tasks to be performed and scope out future enhancements or challenges to overcome, in a much more organised and systematic manner.

![trello_tasks](assets/trello.png)

### User Journey/Workflow
![myMDb_workflow](assets/user-journey.jpg) -->

### Project Plan & Timeline
The scope for Pizza Cake v1.0 initial build was two days. After finding and testing OMDb's API, our first step was to narrow down the information we wanted to use from the hash returned within our application, and in turn, define what the primary purpose and scope of the MVP would be. Given the two-day turnaround, time management was key, and initial discussions focused on balancing brainstorming possibilities with current limitations. Along the way, current challenges and ideas for future enhancements were noted for our documentation. -->

<!-- Day 1 tasks and time were largely spent on buiilding menues and defining methods to return user input selection and order total, refining the main workflow, functionality and features, logic for methods in Trello, and getting a functional base code.

Day 2 tasks and time were largely spent on cleaning up and enhancing the user interface, testing user selection, writing documentation.

Following this approach enabled as to best manage our time to effectivley to reach project mile stones and the end goal of a working application -->


### Coding Process
<!-- After defining the menus, options for user selection for Pizza Cake user interface and backend,
functional base code was created for user selections. This invloved methods to add, delete, place orders and push user inputted data into an empty arrays to hold the order details. -->

<!-- Additonal time was spent improving the user interface to improve functionality and return values
 -->

<!-- After testing the application to ensure that the user is looped back to the main menu after user makes selection and all menu functions are working -->


### Challenges
* Scaling back features to the minimum to plot out iterative future enhancements.
* No functionality to export or inbuilt database to store values outside of a single user session or store movie titles for randomiser.
* Finding an API for movie information data retrieval.
* Testing out movie titles stored in randomiser due to exact/near exact search parameters required by API.

### Future Enhancements
* Functionality to export or email list to within display movies option.
* Create a database to store movie shortlist permanently (beyond a single session).
* Enable broad match search parameters using OMDb API.
* Generate a list of movies by genre for randomiser via an API rather than manual hardcoding.
* Add error messages – e.g. if duplicate movies are added (“This movie already exists.”)
* Functionality to update or delete existing movie entries.