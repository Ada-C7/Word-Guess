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

 def create_new_game()
   create_marquee

 end

def sample_word(type, type_hash)
end

 sampled_word = Word.new(dictionary_hash[type].sample)

 def check_letter(guess)
   if @name.include?(guess.name)
     "Yes, this letter is in this word."
     #Letter shows up on Marquee
   else
     "Nope, guess again, lose a life."
     #Something happens to Art
   end
 end

end

#   def choose_word(word, number_of_letters)
#
#   end
#
# end
#
class Letter
attr_accessor :name

  def initialize(letter)
    @name = letter
  end

end



class Marquee
  attr_accessor :number

  def initialize(sampled_word)
    @number = sampled_word.name.length
  end

  def create_marquee()
    print "_" * @number
  end

end

# class Art
#
# end
#
#Methods
# def trigger
#   #asses guess, modify Art & Marquee
#
# end

print "What type of word would you like to guess?"
type = gets.chomp.to_sym



puts sampled_word.name.length

game_marquee = Marquee.new
puts game_marquee

# #Prompts player to make a guess
# puts "What letter would you like to guess?"
# letter = gets.chomp.downcase
#
# guess = Letter.new(letter)
# #
# puts guess.class
# puts sampled_word.check_letter(guess)
#
# # print "What letter would you like to guess?\r"
# guess = gets.chomp
#
# print "Your guess is #{ guess }.\r"

# dictionary_hash = {
#  sports: ["ball", "basket"],
#  foods: ["apple", "soup"]
# }
