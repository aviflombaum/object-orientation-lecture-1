a_sentence = "Work hard, be nice, stay positive, and have faith everything will work out."

def count_words(sentence)
  word_count = sentence.split(" ").size
  puts "The sentence has: #{word_count}"
end

count_words(a_sentence)

another_sentence = "Passing data around sucks."

count_words(another_sentence)

class String

  def word_count
    self.split(" ").size
  end

end

puts "a_sentence has #{a_sentence.word_count} words."
puts "another_sentence has #{another_sentence.word_count} words."

class Baby

  def initialize
    self.cry
  end

  def cry
    puts "Waaaa!"
  end

  def my_scope
    puts self.inspect
  end
end

Baby.new

Baby.new.my_scope