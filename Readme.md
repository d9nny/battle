To view site visit: https://lit-temple-9763.herokuapp.com/

About
====

To create a battle game allowing wither single player or multiplayer. The aim of the game is to defeat your opponent using the combination of different moves. Basic attack deducts most damage from the player. Paralyse attack will deduct a little damage and potentially provent the opposing player from taking a turn if paralysed. Poison attack will deduct mid damage and will potentially take damage off the opposing player the next round if poisoned. Sleep attack will put the opposing player to sleep meaning that they miss a go.

Installation
-----------

Clone this repo to your local machine

```sh
$ git clone https://github.com/d9nny/battle
```
Run Bundler to install Gems: 
```sh
$ bundle
```
Navigate to the root directory in the terminal and start the server: 
```sh
$ ruby app.rb
```
Take a note of the port number and navigate to 'http://localhost:port_number' in your browser.

Testing
-------
To run the unit and feature tests for Battle, please navigate to the root directory of the project and run: 
```sh
$ rspec
```
To Do
-----
Still a work in progress, would like to add paralyse and poison functionality as they currently just deduct damage. 

Technologies used:
-----------------
Ruby
Sinatra
TDD (via RSpec and Capybara)
