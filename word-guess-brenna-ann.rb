require "faker"

class SecretWord
  attr_reader :word, :length, :word_array
  # if random word is longer than 10, regenerates word
  def initialize
    word = Faker::Cat.name
    if word.length > 10
      word = Faker:: Cat.name
    else
      @word = word.upcase
      @length = word.length
      @word_array = word.upcase.scan /\w/
    end
  end

  # def to_array
  #   @word_array = @word.scan /\w/
  #
  # end

end


class Guess
  attr_reader :word, :user_input

  def initialize (word, user_input)
    @word = word
    @user_input = user_input
  end


end


word1 = SecretWord.new
puts "give me a letter"
user_input = gets.chomp.upcase
guess1 = Guess.new(word1, user_input)

#this is the conditional for guessing
if word1.word_array.include?(user_input)
  puts "right"
else puts "wrong"
# elsif puts "win"
# else puts "lose"
end



puts word1.word

puts word1.length
puts word1.word_array[0]
