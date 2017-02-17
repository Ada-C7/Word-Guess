require 'faker'

class WordGuess

  def initialize
    @correct_word = (Faker::Color.unique.color_name)
    word_test

    @correct_letter_array = []
    build_correct_letter_array

    @used_letters = []
    @wrong_letter_array = []

    puts "Ready to have some word guessing fun? Try to guess the word before all the birds fly away. Let the games begin!"

    puts "This is the initial art!"
    puts
    puts "- " * @correct_word.length

    begin_game
  end

  #Makes sure the word being used is a single word (no spaces)
  def word_test
    while @correct_word.include?(" ")
      @correct_word = (Faker::Color.unique.color_name)
    end
  end

    #puts the letters of the given word into an array without duplicates
    def  build_correct_letter_array
      @correct_word.each_char do |letter|
        if !(@correct_letter_array.include?(letter))
          @correct_letter_array << letter
        end
      end
    end


      def begin_game
        while @correct_letter_array != []
          turn
        end
        "Congratulations! You guesst it! Your lilly pad is hopping."
        continue_game
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
          if !(@wrong_letter_array.include?(guess))
             @wrong_letter_array << guess
          end
        end
        puts
        puts "The wrong letters guessed are:"
        print  @wrong_letter_array
        puts

        if game_end?
          puts "Sorry, you used up all your guesses. All the frigs have leapt away and you are sitting aolne at an empty pond."
          continue_game
        end

      end


      def continue_game
        print "Do you want to keep playing? (Y to play / N to quit):"
        answer = gets.chomp.downcase
        until answer == "y"|| answer =="n"
          print "Enter Y/N: "
          answer = gets.chomp.downcase
        end
        if answer == "n"
          exit
        else
          new_game = WordGuess.new
        end
      end



      private

      def game_end?
        @wrong_letter_array.length == 5
      end

    end


    game_one = WordGuess.new
