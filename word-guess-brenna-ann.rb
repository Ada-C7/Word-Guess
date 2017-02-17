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

  def initialize (word_array, letter, next_right_array, next_wrong_array)
    @word_array = word_array
    @letter = letter
    @right_array = next_right_array
    @wrong_array = next_wrong_array
  end

  def guess_right
    # checks guessed letter for frequency in word


# below only adds the first index the letter appears in the word
    index = nil
    @word_array.each do |character|
      if character == @letter
        index = @word_array.index(character)
        @right_array.delete_at(index)
        @right_array.insert(index, @letter)
      end
    end
    return @right_array
  end

  def guess_wrong
    @wrong_array << @letter
  return @wrong_array
  end


end

# (word1.length).times do
# print "-"


word1 = SecretWord.new
next_right_array = Array.new(word1.length, "_")
next_wrong_array = Array.new(word1.length, "_")

puts word1.word
puts word1.to_array


while next_right_array.include?("_")
  #this is the conditional for guessing
  puts "give me a letter"
  user_letter = gets.chomp.upcase
  guess1 = Guess.new(word1.to_array, user_letter, next_right_array, next_wrong_array)

  if word1.to_array.include?(user_letter)
    guess1.guess_right
    next_right_array = guess1.guess_right
    print next_right_array
    print next_wrong_array
  else
    guess1.guess_wrong
    next_wrong_array = guess1.guess_wrong
    print next_right_array
    print next_wrong_array
  end
  # elsif puts "win"
  # else puts "lose"
end
