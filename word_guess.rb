#https://github.com/Ada-C7/Word-Guess
class WordGame

  # def initialize(counter)
  #   @counter = counter
  #   @ = 9
  # end

  def ascii_art
    9.times do
      print " ^⨀ ᴥ⨀ ^ "
    end
  end

end

worddammit = WordGame.new
worddammit.ascii_art
