#https://github.com/Ada-C7/Word-Guess
require 'faker'

class WordGame

  def initialize
    @lives = 9
    @word = Faker::Cat.unique.name
  end

  def test_1
    puts "#{@word}"
  end

  def ascii_art
    @lives.times do
      print " ^⨀ ᴥ⨀ ^ "
    end
  end

end

worddammit = WordGame.new
worddammit.ascii_art
worddammit.test_1
