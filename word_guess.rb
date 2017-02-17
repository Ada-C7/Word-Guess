
class Word
  def initialize
    @word = []
    @word_in_progress = []
  end


  def check_letter(letter)
  end

  def update_word_in_progress(letter)
  end

  def won?
    if @word == @word_in_progress
      return true
    else
      return false
    end
  end

  def check_word
  end

  def print_word
  end

end

class Flower
  def initialize
  end

  def lost?
  end

  def setup_ascii
  end

  def update_ascii
  end

  def print_ascii
  end

end


def main

end
