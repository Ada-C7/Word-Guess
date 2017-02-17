class WordGuess
  attr_reader = :word

  def initialize
    @word = gen_word
    @word_as_dashes = []
    @word_as_array = word_dash
    @ascii = ascii
    puts intro
  end

# show ascii, generate word, show dashes
  def intro
    puts @word_as_dashes.join # make this part print better and then commit
  end

  def gen_word
   array_of_words = ["pug", "stumptown", "normcore", "pitchfork", "chillwave", "cardigan"]
   @word = array_of_words[rand(0..5)]
  end

  def ascii
    #  %q{
     #
    #                *
    #          *   *
    #        *    \* / *
    #          * --.:. *
    #         *   * :\ -
    #           .*  | \
    #          * *     \
    #        .  *       \
    #         ..        /\.
    #        *          |\)|
    #      .   *         \ |
    #     . . *           |/\
    #        .* *         /  \
    #      *              \ / \
    #    *  .  *           \   \
    #       * .
    #      *    *
    #     .   *    *  }

  end

  def word_dash
    @word_as_array = @word.chars
    @word_as_array.each do
      @word_as_dashes.push("_ ")
    end
    # @word_as_dashes = @word_as_dashes.to_s
  end

  def match
  end

  def guess
  end

  # private

  def update_ascii
    @ascii = @ascii.delete("*")
  end

  def update_dash
  end

  def update_guessed_letters
  end


end


new_game = WordGuess.new
