require 'faker'

class WordGuess

  def initialize
    @correct_word = (Faker::Color.unique.color_name)
    while @correct_word.include?(" ")
      @correct_word = (Faker::Color.unique.color_name)
    end

    @correct_letter_array = []

    @correct_word.each_char do |letter|
      if !(@correct_letter_array.include?(letter))
        @correct_letter_array << letter
      end
    end


    @used_letters = []

    puts "Ready to have some word guessing fun? Try to guess the word before all the birds fly away. Let the games begin!"

    puts "This is the initial art!"
    puts
    puts "- " * @correct_word.length


  begin_game

  end

def begin_game
  while @correct_letter_array != []
    turn
  end
end



    def turn
      #WILL NOT BE IN REAL games
      puts "secret word = "+ @correct_word
      #######

      puts "Please choose a letter:"
      guess = gets.chomp.downcase

      #Testing that user input is a single valid letter
      until (guess.length == 1) && guess[/[a-zA-Z]+/] == guess
        puts "C'mon. that's not a letter. What letter would you like to guess?"
        guess = gets.chomp.downcase
      end

      @used_letters << guess

      @correct_word.each_char do |n|
        if @used_letters.include?(n)
          print n

          @correct_letter_array.delete(n)
        else
          print "_ "
        end
      end
      puts
    end


  end


game_one = WordGuess.new
