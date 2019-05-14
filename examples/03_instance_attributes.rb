class Dog

  def name
    @name
  end

  def name=(dog_name)
    @name = dog_name
  end

  def bark
    puts "Woof! I'm #{@name}"
  end

end

the_dog = Dog.new
the_dog.name=("Fido")

puts "Let's look at the object:"
puts the_dog.inspect
puts "Notice the @name inside the object?"
puts ""

another_dog = Dog.new
another_dog.name = "Snoopy"
puts "Let's look at this other dog:"
puts another_dog.inspect
puts "Both dogs have an @name but with different values"
puts ""

puts "Read @name from inside each dog:"
puts another_dog.name
puts the_dog.name
puts ""

class Dog
  attr_accessor :breed
end

lassie = Dog.new
lassie.name = "Lassie"
lassie.breed = "Collie"

puts "#{lassie.name}'s breed is #{lassie.breed}"
