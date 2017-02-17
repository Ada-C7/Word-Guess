require 'faker'
#require 'ASCII'
class GamePlay
  attr_reader :word_array, :letter_guess, :word_placeholders, :incorrect_guess

  def initialize
    puts "Enter a letter:"
    @letter_guess = gets.chomp
    word = "green" #[Faker::Color.color_name, Faker::Hacker.noun, Faker::Hacker.verb].sample
    @word_array = word.scan /\w/
    @word_placeholders = ("- "*@word_array.length).split(" ")
    @incorrect_guess = []
    @chances_left = 5
    # print @word_placeholders
    # print @word_array #for testing

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
  #checks if guessed letters are in our word
    return @word_array.any? { |guess_match| @letter_guess.include?(guess_match)}
  end

  def add_to_incorrect_guess_array
    @incorrect_guess.push(@letter_guess)
  end

  def update_result #passage of time #private?
    if @chances_left > 0
      if check_letters?
        puts "Good job!"
        update_word
      else
        puts "Wrong guess"
        add_to_incorrect_guess_array
        puts "These are all your wrong guesses #{@incorrect_guess}"
        @chances_left -= 1
        #remove a chance from ASCII
      end
    else
      puts "Sorry! You weren't able to guess the right word."
    exit
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
