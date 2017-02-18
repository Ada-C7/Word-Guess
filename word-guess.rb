require 'faker'
#require 'ASCII'
class GamePlay
  attr_reader :word_array, :letter_guess, :word_placeholders, :incorrect_guess, :art

  def initialize
    puts "Enter a letter:"
    @letter_guess = gets.chomp
    word = [Faker::Color.color_name, Faker::Hacker.noun, Faker::Hacker.verb].sample
    @word_array = word.scan /\w/
    @word_placeholders = ("- "*@word_array.length).split(" ")
    @incorrect_guess = []
    @chances_left = 4
    @art = "4-guesses.txt"
  end

  def update_word
    # Updates dashes with the correct letters
    @word_array.each_with_index  do |letter, index|
      if letter == @letter_guess
        @word_placeholders[index] = letter
      end
    end
    p @word_placeholders
  end

  def display_image
    File.open(@art) do |f|
      f.each_line do |line|
        print line
      end
    end
  end

      def check_letters?
        #checks if guessed letters are in our word
        return @word_array.any? { |guess_match| @letter_guess.include?(guess_match)}
      end

      def add_to_incorrect_guess_array
        @incorrect_guess.push(@letter_guess)
      end

      def update_result #passage of time #private?
        until @chances_left == 0 do
          if check_letters?
            puts "Good job!"
            update_word
            if !@word_placeholders.include?("-")
              puts "Congratulations! You've guessed the word."
              exit
            end
          else
            puts "Wrong guess"
            add_to_incorrect_guess_array
            puts "These are all your wrong guesses #{@incorrect_guess}"
            @chances_left -= 1
            #remove a chance from ASCII
          end
          case @chances_left
          when 4
            @art = "4-guesses.txt"
            display_image
          when 3
            @art = "3-guesses.txt"
            display_image
          when 2
            @art = "2-guesses.txt"
            display_image
          when 1
            @art = "1-guesses.txt"
            display_image
          end
          puts "Enter another letter:"
          @letter_guess = gets.chomp
        end
        puts "Sorry! You weren't able to guess the right word."
        exit
      end
    end



    new_game = GamePlay.new
    #new_game.update_word
    # new_game.check_letters?
    new_game.update_result
    # new_game.display_image
