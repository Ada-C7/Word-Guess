class WordGuess
  attr_reader = :word, :guessed_array
  attr_accessor = :guess

  def initialize
    @word = gen_word
    @word_as_dashes = []
    @word_as_array = word_dash
    @ascii = ascii
    @guess = " "
    @guessed_array = []
    puts intro
  end

# show ascii, generate word, show dashes
  def intro
    puts "WELCOME TO THE LOVEGOODS' COOL WORDGUESS GAME"
    puts ascii
    puts @word_as_dashes.join # make this part print better and then commit
    puts "Guess a letter! (parseltongue NOT accepted)"
    guess
  end

  def gen_word
   array_of_words = ["pug", "stumptown"] #{}"normcore", "pitchfork", "chillwave", "cardigan"]
   @word = array_of_words[rand(0..1)]
  end

  def ascii
  return   %q{
         +    o    +    :
  +    o   +  +  *  o    +
    o   :  *   *   :  + :    o
      :  *    \* / * o   +
    +      * --.:. *   +   :
o    :    *   * :\ -  o    +
    :   o   .*  | \     :
        +  * *     \
    +    .  * :     \
        + .. o      /\.
      o  *  +       |\)|
    +  .   * :       \ |
      . . *    +      |/\
  o    : .* *         /  \
       *  o +   +     \ / \
     *  .  * o         \   \
        * .:   +  o
       * +  * o
  o   .   * :   *  }

  end

  def word_dash
    @word_as_array = @word.chars
    @word_as_array.each do
      @word_as_dashes.push("_ ")
    end
  end

  def guess
    puts "Enter your letter"
    @guess = gets.chomp.downcase
    self.match
  end

  def match
    if @word.include? "#{@guess}"
      self.update_dash
    else
      self.update_guessed_letters
      self.update_ascii
    end
  end

  # private ?

  def update_ascii
    # @ascii = @ascii.delete("*")
    puts "ascii"
  end

  def update_dash
    puts "dashes"
  end

  def update_guessed_letters
    puts "guessed letters"
    @guessed_array << @guess
    puts @guessed_array
  end


end


new_game = WordGuess.new
