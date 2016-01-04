About

To create a battle game allowing wither single player or multiplayer. The aim of the game is to defeat your opponent using the combination of different moves. Basic attack deducts most damage from the player. Paralyse attack will deduct a little damage and potentially provent the opposing player from taking a turn if paralysed. Poison attack will deduct mid damage and will potentially take damage off the opposing player the next round if poisoned. Sleep attack will put the opposing player to sleep meaning that they miss a go.


Usage

Clone this repo to your local machine

Run Bundler to install Gems: bundle

Navigate to the root directory in the terminal and start the server: ruby app.rb

Take a note of the port number and navigate to http://localhost:port_number in your browser.
visit: https://lit-temple-9763.herokuapp.com/

Testing

To run the unit and feature tests for Battle, please navigate to the root directory of the project and run: rspec


To Do

Still a work in progress, need to add paralyse and poison functionality as they currently just dudct damage. 
Need to add HTML and CSS.


Technologies used

Ruby
Sinatra
TDD (via RSpec and Capybara)
