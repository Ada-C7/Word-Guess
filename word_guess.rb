# #Classes
# class Dictionary
#
#
#   initialize(dictionary_hash)
#     @type = dictionary_hash[:type]
#   end
#
# end

class Word
 attr_accessor :name

 def initialize (word)
   @name = word
 end

end

#   def choose_word(word, number_of_letters)
#
#   end
#
# end
#
class Letter

  def initialize(letter)

  end

end

# class Marquee
#
# end
#
# class Art
#
# end
#
# #Methods
# def trigger
#
# end

print "What type of word would you like to guess?"
type = gets.chomp.to_sym

dictionary_hash = {
 sports: ["ball", "basket"],
 foods: ["apple", "soup"]
}

sample = Word.new(dictionary_hash[type].sample)

puts sample.name

puts "What letter would you like to guess?"
letter = gets.chomp.downcase

guess = Letter.new(letter)

puts guess
#
# print "What letter would you like to guess?\r"
# guess = gets.chomp
#
# print "Your guess is #{ guess }.\r"
