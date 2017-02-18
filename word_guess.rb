#Classes
class Game

  # def initialize
  #   #SOMETHING NEEDS TO GO IN HERE?
  # end

  def create_new_game
    get_word
    make_art
    make_marquee
  end

  def get_word
    while true
      #promts user to enter a type of word they
      #want to guess
      print "What type of word would you like to guess?\n"
      number = 1
      dictionary_hash = {
        #  sports: ["ball", "basket", "hoop", "stadium", "tennis", "gymnastics", "curling", "badminton", "referee", "athlete"],
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
      @game_word = (dictionary_hash[type].sample)
      print @game_word
      break
    else
      puts "That's not a type of word we can use.  The types are: "
    end
    end
  end

  def make_marquee
    marquee_array = []
    @game_word.length.times do
      marquee_array << "_"
    end
    marquee_array.each do |space|
      print "#{space} "
    end
  end

def make_art
  wrong_guess_0 = <<HEREDOC
  ,
  .@,
  .@a@a,.
  S@@ss@@@@a,.
  sS@@@ss@@@@@Ss,  ,
  , SSSSS@@@ss@@@SSSs @,
  @sSSSSSSSS@@ss@SSSSs@@s, ,
  `@@@@@SSSSSSSSssSSS@@@@@sSs,
  @@@@@@@@@@@@@@ss@@@@@@@@SSs ,
  , `@@@@@@@@@@@@@@ss@@@@@@@SSSs@,
  SsSSSS@@@@@@@@@@@ss@@@@@@SSSSS@,
  `SSSSSSSSS@@@@@@@@@ss@@@@SSSSS@@
  `SSSSSSSSSSSS@@@@@@ss@@SSSSSS@@',''',
  , `SSSSSSSSSSSSSSS@@ss@SSSSS@@@;%,.,,`
  @aSSSSSSSSSSSSSSSSSSssSSSS@@@@;%;%%'
  `@@@@@@@SSSSSSSSSSSSssSSS@@@@;%;%'
   `@@@@@@@@@@@@@@@SSSssS@@@@;%;%
      `@@@@@@@@@@@@@@@@@ss@@@;%;%    ...,,,,,,,,,,..
          `@@@@@@@@@@@@@@@ssS;%;%  .;;%%;%%;%%%;%%;%%%,.
    .,::;;;;;;;;`SSSSSSSSSSSss;%%,::;%;%%%%%%%;%%%%%%;%%%%,.
  .:::;;;;;%;;;;;;;,;;,;;,;;,::,.,::;%%%%%;%%%%%%%%%%%%%%%;%%%;,
  .:::;;;%;;;;;%;%;%;%;%;%;%%%%;%%%%%;%%%%%%%%%%;%%%%%;%%%%%%%%;%%;.
  :::;%;;;;%;;%;;;%;%;;%%%;%%%%%%%;%%%%%%%;%%%%%%%%%x%x%%%%%%%%;%%;%;,
  :::;;;;;%;;%;;;%;;%;%%%%%%%%;%%%%%%%%%%%%%%%%%%%%%%%x%x%%%%%%%%%%%;%;,
  :::;;;;;%;;;;;;%;%%;%xx%;%%%%%%%;%%%%%%%x%%%%%%%%%%%%%x%x%x%%%%%%%;%;%;
  ,:::;%;;%;;;%;%;;%;%%x%;%%%%%%%%%%%%%x%x%%x%%%%%%%%%%%%%x%%x%x%%%%%%;%%;,
  :::;;;;%;;%;;%;;%%%;x%x%%%;%%%%%%%%%%%%%x%%x%%%%%%%%%%%xx%x%x%%%%%%%%;;%;
  :::%;;;;;%;;%;;%%;%%;%;%%%%%%%%%%%%;%%x%%x%%x%;%%%%%%%%%x%x%%%%%%%%%;%;%;
  :::;;;%;;;;%;%;%;%%;%%%%%%%;%%%%%%%%%%%x%%x%%%%%%%%%%%%x%x%%x%%%%%%;%;%%;
  `:::;;;;%;%;%;%;%%;%%;%%%%%%%%%%%%%%%%%%%x%x%%%%%%%%%%xx%x%%%%%%%%%;%;%;'
  `:::;;%;%;;%;;%%;%%;%;%%;%%%%%;%%%%%%%%%%%%%%%%%%;%%%%x%%%%%%%%%;%%;%;'
  `:::;;;;;%;;%%;%%;%%%%%%%;%%%%%%%%%%;%%%%%%%%;%%%%%;%%%%%%%%%;%%;%%;'
  `:::;;%;;;%;;;%%%;%%;%%%%%%%%%%;%%%%%%%%%%;%%%%%%%%%%%%%%;%;%;%%%;'
  `:::;;%;;;%%;%;%;%%;%;%%%%%%%%%%%%%%%%%%%%%%;%%;%%%%;%%%;%;%;%;'
  `:::;;;%;;%;;%%;%;%%%%%%%%%%%%%%%%%%;%%%%%%%%%%%;%%%;%%;%%;'
    `:::;;;%;;%;%;%%%%;%%%%%%;%%%%%%%%%%%%;%%%;%%;%%;%%;%%;'
      `:::;;%;;%;;%;%%%%%%;%%%%%%%%%%%%;%%%%%%%%%%%;%;%%;'
        `:::;%;;;%;;%;%x%%%%%;%%%%%%%%x%%%%%%;%%%;%%;%;'
          `:::;;;%;%;;%;x%x%x%%x%;%x%x%%%%;%%%%%;%;%;'
            `:::%;%;;%:%:,xx%%x%%x%xx,:%%%%;%%;%%%;'
              `:::%;;;;:%:`xx%x%xx%x':%%%;%%%%%%;'
               `:::;;%;;%:,`%x%xx%x',:%;%%%%;%%;'
                 `:::;;;;;:::'   `:::;;;;;;:::'

HEREDOC
  wrong_guesses = [wrong_guess_0]

     print wrong_guesses[0]
end
end

new_game = Game.new
new_game.create_new_game

#CODE CALLED IN game_word
# print "\nwhat is your guess?"
# letter = gets.chomp
#
# game_word_array = game_word.split("")
#   if game_word_array.include?(letter)
#     #iterate through game array, return the index(s)
#     #that include that letter
#     replace = game_word_array.each_index.select do |index|
#       game_word_array[index] == letter
#     end
#     #for each index number that matches letter
#     #replace the _ with letter in marquee
#     replace.each do |matching_index|
#       marquee_array[matching_index] = letter
#     end
#   end
#
# print marquee_array

# create_new_game
