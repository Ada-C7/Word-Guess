

class WordGuess

  def initialize
    @correct_word =  ["potato", "america", "flower"].sample
    @used_letters = []
    puts "Ready to have some word guessing fun? Try to guess the word before all the birds fly away. Let the games begin!"

    puts "This is the initial art!"
    puts
    puts "- " * @correct_word.length

    turn
  end


  def turn
    #WILL NOT BE IN REAL games
    puts "secret word = "+ @correct_word
    
    puts "Please choose a letter:"

    guess = gets.chomp.downcase

    until (guess.length == 1) && all_letters(guess)
      puts "C'mon. that's not a letter. What letter would you like to guess?"
      guess = gets.chomp.downcase
    end

    used_letters << guess
    @correct_word.each_char do |n|
      if used_letters.include(n)
        puts n
      else
        puts "Sorry, the letter #{n} is not in the word."
      end
    end
  end

end

game_one = WordGuess.new
