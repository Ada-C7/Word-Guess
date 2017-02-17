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
    end
  end

  def to_array
    @word.scan /\w/
  end

end


class Guess
  attr_reader :letter, :right_array, :wrong_array

  def initialize (word_array, letter)
    @word_array = word_array
    @letter = letter
    @right_array = Array.new(word_array.length)
    @wrong_array = Array.new(word_array.length)
  end

  def guess_right
    # checks guessed letter for frequency in word


# below only adds the first index the letter appears in the word
    index = nil
    @word_array.each do |character|
      if character == @letter
        index = @word_array.index(character)
         @right_array.insert(index, @letter)
      end
    end
    print @right_array
    puts "right"
  end

  def guess_wrong
    wrong_array << @letter
  end

  def win
  end

  def lose
  end

end



word1 = SecretWord.new
puts word1.word
puts word1.to_array
puts "give me a letter"
user_letter = gets.chomp.upcase
guess1 = Guess.new(word1.to_array, user_letter)

#this is the conditional for guessing
if word1.to_array.include?(user_letter)
  guess1.guess_right
else puts "wrong"
# elsif puts "win"
# else puts "lose"
end
