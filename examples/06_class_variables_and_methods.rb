class Person
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end

avi = Person.new("Avi")
rishi = Person.new("Rishi")
grace = Person.new("Grace")

Person.all.each.with_index do |person, i|
  puts "#{i}. #{person.name}"
end

class Person
  attr_accessor :gender

  def self.find_by_name(name)
    @@all.find do |person|
      person.name == name
    end
  end
end

rishi.gender = "Male"

matching_person = Person.find_by_name("Rishi")
puts "I found #{matching_person.name}, they are a #{matching_person.gender}"

class Person

  def self.find_all_by_gender(gender)
    self.all.select do |person|
      person.gender == gender
    end
  end

end

avi.gender = "Male"
grace.gender = "Female"

anita = Person.new("Anita")
anita.gender = "Female"

ada = Person.new("Ada")
ada.gender = "Female"

puts "Males: #{Person.find_all_by_gender("Male").size}"
puts "Females: #{Person.find_all_by_gender("Female").size}"

class Person

  def self.create_by_name_and_gender(name, gender)
    new_person = Person.new(name)
    new_person.gender = gender
    new_person
  end

end

Person.create_by_name_and_gender("Karlie", "Female")

matching_person = Person.find_by_name("Karlie")
puts "I found #{matching_person.name}, they are a #{matching_person.gender}"