require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'word_guess'

class TestWordGuess < MiniTest::Unit::TestCase
  def test_creation_of_word_guess
    @game = WordGuess.new
    # The class of @die should be Die
    assert @game.class == WordGuess, "There must be a WordGuess class."
  end
end
