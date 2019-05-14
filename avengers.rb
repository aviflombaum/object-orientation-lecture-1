require 'date'

## Part 1: Database
require_relative './lib/avenger.rb'

ironman = Avenger.new
ironman.name = "Tony Stark"
ironman.superhero = "Ironman"
ironman.powers = ["Smart", "Rich"]
ironman.birthday = "29-05-1970"

## Part 3: Command Line Interaction
## The following methods deal with allowing the person to interact with our
## avenger database by presenting them with a menu and options.

## `index_action` will call `Avenger.print_all` to print out all the avengers
## in the database and return to the main menu.
def index_action
  puts ""
  puts "Listing Avengers in the Database:"
  puts ""
  Avenger.print_all
  puts ""

  main_action
end


## `search_action` will ask the person for a superhero name and pass that to
## `Avenger.find_by_superhero`. If found, it will pass the superhero's hash to
## `Avenger#bio` to print out more details. At the end of the routine, it
## will return to the main menu,
def search_action
  puts ""  
  puts "Who would you like to know more about?"
  puts ""
  
  input = gets.strip
  selected_avenger = Avenger.find_by_superhero(input)
  puts ""

  if selected_avenger
    puts "Found #{input}"
    puts "-----"

    selected_avenger.bio
  else
    puts "Couldn't find #{input}, try adding them from the main menu."
  end

  puts ""
  main_action
end

## `new_action` will ask the person for details about the avenger to add to 
## the database and then build the superhero hash and push it into the database
## array. It will also use `avenger_bio` to show the person the avenger they
## added and then return to the main menu.
def new_action
  puts ""
  puts "Add an Avenger:"
  
  puts "What is their Superhero name?"
  superhero_name = gets.strip

  puts "What is their real name?"
  real_name = gets.strip

  puts "What are their powers, seperated by commas?"
  powers = gets.strip.split(",")

  puts "When were they born (date-month-year)?"
  birthdate = gets.strip

  new_avenger = Avenger.new
  new_avenger.name = real_name
  new_avenger.superhero = superhero_name
  new_avenger.powers = powers
  new_avenger.birthday = birthdate
  
  puts ""
  puts "Added #{superhero_name}:"
  new_avenger.bio
  puts ""

  main_action
end

## `main_action` will present the person with the main menu of our program.
def main_action
  puts "Welcome to the Avengers Database, what would you like to do?"
  puts "Supported Commands: menu, search, index, new, exit"
  puts ""

  input = gets.strip.downcase
  case input
  when "search"
    search_action
  when "index"
    index_action
  when "new"
    new_action
  when "menu"
    main_action
  when "exit"
    exit
  else
    puts "Invalid Command."
    main_action
  end
end


## Part 4: Executing our program.
main_action
