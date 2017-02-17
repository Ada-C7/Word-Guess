require 'faker'
class GamePlay
  attr_reader :word_array, :letter_guess, :word_placeholders

  def initialize
    puts "Enter a letter:"
    @letter_guess = gets.chomp
    word = "green" #Faker::Color.color_name
    @word_array = word.scan /\w/
    # @word_placeholders = []
    @word_placeholders = ("- "*@word_array.length).split(" ")
    print @word_placeholders
    print @word_array #for testing

    #call update_image
    #call generate_word methods
  end

  def update_word
  # Updates dashes with the correct letters
    @word_placeholders = @word_array.map do |letter|
    if letter == @letter_guess
      @letter_guess
    else "-"
    end
  end
    p @word_placeholders
  end
  # end
#
#   def update_image (#Incorrect guess)
#     #initial image with all 5 flowers
#     #case when flowers = 0 statement (ex. 5 flowers)
#     # flowers -= 5
#     # flowers =4, output 4.txt
#   end

  def check_letters?
    return @word_array.any? { |guess_match| @letter_guess.include?(guess_match)}
  end

  # def add_to_correct_guess_array
  #   #adds all our correct guesses, to the correct guess array
  # end
  #
  # def add_to_incorrect_guess_array
  #   #adds all our incorrect guesses, to the incorrect guess array
  # end
  #
  def update_result #passage of time
    if check_letters?
      puts "Good job!"
      update_word
    else
      puts "Wrong guess"
      #remove a chance from ASCII
    end
  end
end

  # File.open(file_name) do |f|
  # f.each_line do |line|
  #   #I added in the colorize gem so if you want color use line 4, else you can omit
  #   line = line.colorize(:cyan)
  #   print line
  # end
new_game = GamePlay.new
#new_game.update_word
# new_game.check_letters?
new_game.update_result
