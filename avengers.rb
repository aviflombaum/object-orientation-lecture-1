require 'date'

## Part 1: Database
ironman = {
  name: "Tony Stark",
  superhero: "Ironman",
  powers: ["Smart", "Rich"],
  birthday: "29-05-1970"
}

# This is our main data object, we'll pass it along to almost every method
# as that's the only way to ensure that a method will have access to this
# local variable.
avengers = [
  ironman
]

## Part 2: Avenger Methods
## These methods relate to functionality around the avengers database.

## `avenger_bio` can take in a hash and print out detailed information
## about the avenger.
def avenger_bio(person_hash)
  puts "Name: #{person_hash[:name]}"
  puts "Superhero Name: #{person_hash[:superhero]}"
  puts "Powers: #{person_hash[:powers].join(",")}"
  puts "Age: #{DateTime.now.year-Date.parse(person_hash[:birthday]).year}"
end

## `find_avenger_by_superhero` can find a particular avenger hash from the
## array of avengers by their superhero name.
def find_avenger_by_superhero(avengers, superhero_name)
  avengers.find do |avenger_hash| 
    superhero_name == avenger_hash[:superhero]
  end
end

## `list_avengers` will iterage through the avengers database and print out
## each superhero name along with a human-readable ID based on the index in
## the array.
def list_avengers(avengers)
  avengers.each.with_index(1) do |avenger, i|
    puts "#{i}. #{avenger[:superhero]}"
  end
end

## Part 3: Command Line Interaction
## The following methods deal with allowing the person to interact with our
## avenger database by presenting them with a menu and options.

## `index_action` will call `list_avengers` to print out all the avengers
## in the database and return to the main menu.
def index_action(avengers)
  puts ""
  puts "Listing Avengers in the Database:"
  puts ""
  list_avengers(avengers)
  puts ""

  main_action(avengers)
end


## `search_action` will ask the person for a superhero name and pass that to
## `find_avenger_by_superhero`. If found, it will pass the superhero's hash to
## `avenger_bio` to print out more details. At the end of the routine, it
## will return to the main menu,
def search_action(avengers)
  puts ""  
  puts "Who would you like to know more about?"
  puts ""
  
  input = gets.strip
  selected_avenger = find_avenger_by_superhero(avengers, input)
  puts ""

  if selected_avenger
    puts "Found #{input}"
    puts "-----"

    avenger_bio(selected_avenger)
  else
    puts "Couldn't find #{input}, try adding them from the main menu."
  end

  puts ""
  main_action(avengers)
end

## `new_action` will ask the person for details about the avenger to add to 
## the database and then build the superhero hash and push it into the database
## array. It will also use `avenger_bio` to show the person the avenger they
## added and then return to the main menu.
def new_action(avengers)
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

  new_avenger = {
    name: real_name,
    superhero: superhero_name,
    powers: powers,
    birthday: birthdate
  }

  avengers << new_avenger
  
  puts ""
  puts "Added #{superhero_name}:"
  avenger_bio(new_avenger)
  puts ""

  main_action(avengers)
end

## `main_action` will present the person with the main menu of our program.
def main_action(avengers)
  puts "Welcome to the Avengers Database, what would you like to do?"
  puts "Supported Commands: menu, search, index, new, exit"
  puts ""

  input = gets.strip.downcase
  case input
  when "search"
    search_action(avengers)
  when "index"
    index_action(avengers)
  when "new"
    new_action(avengers)
  when "menu"
    main_action(avengers)
  when "exit"
    exit
  else
    puts "Invalid Command."
    main_action(avengers)
  end
end


## Part 4: Executing our program.
main_action(avengers)
