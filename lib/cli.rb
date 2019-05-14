class CLI

  def main
    puts "Welcome to the Avengers Database, what would you like to do?"
    puts "Supported Commands: menu, search, index, new, exit"
    puts ""

    input = gets.strip.downcase
    case input
    when "search"
      search
    when "index"
      index
    when "new"
      new
    when "menu"
      main
    when "exit"
      exit
    else
      puts "Invalid Command."
      main
    end
  end

  def index
    puts ""
    puts "Listing Avengers in the Database:"
    puts ""
    Avenger.print_all
    puts ""

    main
  end

  def search
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
    main
  end

  def new
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

    main
  end
end