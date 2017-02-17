require 'faker'
class GamePlay
  attr_reader :word_array

  def initialize
    @letter_guess = gets.chomp
    word = Faker::Color.color_name
   @word_array = word.scan /\w/
    print @word_array #for testing

    #call update_image
    #call generate_word methods
  end
# end
#   def update_word
#     #display the generated word in dashes (word.length * "-")
#   end
#
#   def update_image (#Incorrect guess)
#     #initial image with all 5 flowers
#     #case when flowers = 0 statement (ex. 5 flowers)
#     # flowers -= 5
#     # flowers =4, output 4.txt
#   end

  def check_letters?

    puts @word_array.any? { |guess_match| @letter_guess.include?(guess_match)}
  end

  # def add_to_correct_guess_array
  #   #adds all our correct guesses, to the correct guess array
  # end
  #
  # def add_to_incorrect_guess_array
  #   #adds all our incorrect guesses, to the incorrect guess array
  # end
  #
  # def update_result
  #   #first go through words check, then update flower
  #   #check_letters(guess)
  #   #if te


  end

  # File.open(file_name) do |f|
  # f.each_line do |line|
  #   #I added in the colorize gem so if you want color use line 4, else you can omit
  #   line = line.colorize(:cyan)
  #   print line
  # end
new_game = GamePlay.new
new_game.check_letters?
