#correct boolean
# define class Turn and begin to elaborate methods
class Game
  attr_accessor :win?

  def initialize (word_array)
    @win?
    @guess
    @counter
    @word_array

  end

  def turn
  end

  def check_guess
  end

  def redraw_letter_blanks
  end

  def update_counter
  end

  def redraw_art
  end

end
#library

library = ["HAI", "HAIRCUT", "POTATO"]

#select word from library
limit = library.length

chosen_word = library[rand(limit)]
word_array = chosen_word.chars
puts chosen_word
puts word_array
#ask user for guess

puts "What's your letter guess?"
guess1 = gets.chomp.upcase

#compare guess against word/report correct or incorrect

if chosen_word.include?(guess1)
  puts "true"
else
  puts "false"
end
