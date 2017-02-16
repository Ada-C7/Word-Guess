# #Classes
# class Dictionary
#
#   initialize(dictionary_hash)
#     @type: dictionary_hash[:type]
#   end
#
# end

class Word
  attr_reader :name

  def initialize(word)
    @word = word

  end

#   def choose_word(word, number_of_letters)
#
#   end
#
# end
#
# class letter
#
# end
#
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

dictionary_hash[type].sample

#
# print "What letter would you like to guess?\r"
# guess = gets.chomp
#
# print "Your guess is #{ guess }.\r"
