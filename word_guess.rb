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
    @wrong_letter_array = []

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

        if !(@correct_word.include?(guess))
            @wrong_letter_array << guess
      end
      puts

      puts "The wrong letters guessed are:"
      puts  @wrong_letter_array

      if game_end?
        puts "You used up all the chances."
        exit
        #continue_game
      end


    end

    private

         def game_end?
           @wrong_letter_array.length == 5
         end

  end


game_one = WordGuess.new
