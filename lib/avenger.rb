class Avenger
  attr_accessor :name, :superhero, :powers, :birthday
  @@all = []

  def initialize
    @powers = []
    @@all << self
  end

  def bio
    puts "Name: #{self.name}"
    puts "Superhero Name: #{self.superhero}"
    puts "Powers: #{self.powers.join(",")}"
    puts "Age: #{self.age}"
  end

  def age
    DateTime.now.year-Date.parse(self.birthday).year
  end

  def self.all
    @@all
  end

  def self.find_by_superhero(superhero_name)
    self.all.find do |avenger| 
      superhero_name == avenger.superhero
    end
  end

  def self.print_all
    self.all.each.with_index(1) do |avenger, i|
      puts "#{i}. #{avenger.superhero}"
    end
  end

end