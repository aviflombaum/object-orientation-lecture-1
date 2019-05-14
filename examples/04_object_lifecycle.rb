class Baby

  def initialize
    puts "Waaaaaaaa!!!!!!"
  end

end

archie_harrison_mounbatten_windsor = Baby.new

north_west = Baby.new

class Baby

  def initialize
    cry
  end

  def cry
    puts "Waaaa!!!!"
  end

end

blue_ivy = Baby.new
blue_ivy.cry

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
    cry
  end

  def cry
    puts "Waaaaaaaa! I'm #{@name}"
  end
end

archie_harrison_mounbatten_windsor = Person.new("Archie Harrison Mounbatten-Windsor")
puts archie_harrison_mounbatten_windsor.name
puts archie_harrison_mounbatten_windsor.cry