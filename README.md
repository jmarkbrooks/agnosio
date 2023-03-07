# AGNOS.IO programming exercise 

## Problem statement:

A day at a coffee shop!

A customer visits a coffee shop that sells a bunch of items (e.g. beverages, sandwiches, etc.).
Items have varying tax rates and some are free or offered at a discount when ordered with another item.
The customer is made aware of the order total and once he pays for it, he can wait until notified of the order completion.
You are required to describe a program with a set of interfaces that models the above problem at hand. You need to design the DB and backend architecture and implement it. Front-end is not mandatory but your endpoints should be reachable through Postman (please attach postman collection).
Users should be able to see the list of available items, User should be able to order them and should get a notification after a fixed amount of time that their order is ready.
Unit test cases are not mandatory.

Tech Stack - Ruby on Rails. You can also show us your front-end skills in some JS technologies (React/Angular, etc) or Bootstrap, or plain Html/JS.
Please send the link with the assessment as soon as you finish it

Notes: Since neither UI nor unit testing was mandatory, to save time this has not been done.

## Instructions

This has been designed to be run locally using Docker.  It can be run in other ways as well, but the instructions will assume you are using Docker Desktop or similar Docker installation to to run the application locally.

* Install Docker if necessary.
* Clone the repository and change into the local repository directory.
* `docker compose build` -- this will build the local app container
* `docker compose run --rm -it app ./bin/rails db:setup` will set up the database and seed it.
* `docker compose up` -- this will start the application stack.
* Install Postman for Desktop if needed.
* Import the Postman suite included into Postman.
* The Postman test suite should include all the necessary steps 1 through 6.
* Step 1 will show the list of items.
* Step 2 creates a sample order.
* Step 3 adds 3 items to the order.
* Step 4 submits the order.  When the order is submitted, browsing to https://localhost:1080 should open the Mailcatcher window and you can see a staff notification email.
* Step 5 marks the order as ready for pickup.  Again, there should be an email, this time notifying the client.
* Step 6 marks the order as complete, representing the pickup/delivery and payment of the order.

The available API endpoints are:
<pre><code>
api_v1_customers GET    /api/v1/customers(.:format)                                                                       api/v1/customers#index
                 POST   /api/v1/customers(.:format)                                                                       api/v1/customers#create
 api_v1_customer GET    /api/v1/customers/:id(.:format)                                                                   api/v1/customers#show
                 PATCH  /api/v1/customers/:id(.:format)                                                                   api/v1/customers#update
                 PUT    /api/v1/customers/:id(.:format)                                                                   api/v1/customers#update
                 DELETE /api/v1/customers/:id(.:format)                                                                   api/v1/customers#destroy
   api_v1_orders GET    /api/v1/orders(.:format)                                                                          api/v1/orders#index
                 POST   /api/v1/orders(.:format)                                                                          api/v1/orders#create
    api_v1_order GET    /api/v1/orders/:id(.:format)                                                                      api/v1/orders#show
                 PATCH  /api/v1/orders/:id(.:format)                                                                      api/v1/orders#update
                 PUT    /api/v1/orders/:id(.:format)                                                                      api/v1/orders#update
                 DELETE /api/v1/orders/:id(.:format)                                                                      api/v1/orders#destroy
    api_v1_items GET    /api/v1/items(.:format)                                                                           api/v1/items#index
                 POST   /api/v1/items(.:format)                                                                           api/v1/items#create
     api_v1_item GET    /api/v1/items/:id(.:format)                                                                       api/v1/items#show
                 PATCH  /api/v1/items/:id(.:format)                                                                       api/v1/items#update
                 PUT    /api/v1/items/:id(.:format)                                                                       api/v1/items#update
                 DELETE /api/v1/items/:id(.:format)                                                                       api/v1/items#destroy
          api_v1 POST   /api/v1/orders/:id/add_item(.:format)                                                             api/v1/orders#add_item
</code></pre>
If there are any questions please contact me at j.mark.brooks@gmail.com
