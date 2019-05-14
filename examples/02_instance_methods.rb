class Dog

  def bark
    puts "Woof!"
  end

end

fido = Dog.new

puts "Watch fido bark:"
puts ""
fido.bark

puts ""
puts "fido can already do a lot of things:"
puts fido.methods.inspect
puts ""

puts "If you wanted to know what methods are unique to Dogs you could do:"
puts ""
puts "Methods local (unique) to Dogs:"
puts (fido.methods-Object.instance_methods).inspect