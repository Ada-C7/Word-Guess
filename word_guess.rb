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

def make_marquee

  marquee_array = []
  game_word.length.times do
    marquee_array << "_"
  end
  print marquee_array

end


#CODE CALLED IN game_word
print "\nwhat is your guess?"
letter = gets.chomp

game_word_array = game_word.split("")
  if game_word_array.include?(letter)
    #iterate through game array, return the index(s)
    #that include that letter
    replace = game_word_array.each_index.select do |index|
      game_word_array[index] == letter
    end
    #for each index number that matches letter
    #replace the _ with letter in marquee
    replace.each do |matching_index|
      marquee_array[matching_index] = letter
    end
  end

print marquee_array
