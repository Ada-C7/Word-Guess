# #Classes
# class Marquee
#   attr_accessor :number
#
#   def initialize(sampled_word)
#     @number = sampled_word.name.length
#   end
#
#   def create_marquee()
#     print "_" * @number
#   end
#
# end

#
#Methods
def get_word

while true
  #promts user to enter a type of word they
  #want to guess
  print "What type of word would you like to guess?\n"
  number = 1
  dictionary_hash = {
   sports: ["ball", "basket", "hoop", "stadium", "tennis", "gymnastics", "curling", "badminton", "referee", "athlete"],
   food: ["apple", "soup", "breakfast", "sprinkles", "picnic", "pancake", "marshmallow", "horseradish", "cinnamon", "artichoke"]
  }
  #lists the types of food words to choose from
  dictionary_hash.keys.each do |type|
    print "#{ number }. #{ type.capitalize }\n"
    number += 1
  end
  type = gets.chomp.downcase.to_sym
  #makes sure their type is included in our list
  if dictionary_hash.keys.include?(type)
    #generates the word to guess
    game_word = (dictionary_hash[type].sample)
    puts game_word
    break
  else
    puts "That's not a type of word we can use.  The types are: "
  end
end

end
