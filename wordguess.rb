require 'Faker'
class WordGuess
  attr_reader = :word, :guessed_array, :counter
  attr_accessor = :guess

  def initialize
    @word = gen_word
    @word_as_dashes = []
    @word_as_array = word_dash
    @ascii = ascii
    @guess = " "
    @guessed_array = []
    @counter = 0
    puts intro
  end

# show ascii, generate word, show dashes
  def intro
    puts "WELCOME TO THE LOVEGOODS' COOL WORDGUESS GAME"
    puts ascii
    puts @word_as_dashes.join
    puts "Guess a letter! (parseltongue NOT accepted)"
    game
  end

  def gen_word
   @word = Faker::HarryPotter.character.downcase
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
    @word_as_array.each do |letter|
      case
        when letter == " "
          @word_as_dashes.push(" ")
          @guess = "   "
          self.update_dash
        when letter == "."
          @word_as_dashes.push(". ")
          @guess = ". "
          self.update_dash
        when  letter == ","
          @word_as_dashes.push(", ")
          @guess = ", "
          self.update_dash
        else
          @word_as_dashes.push("_ ")
        end
      end
  end

  def guess
    puts "Enter your letter:"
    @guess = gets.chomp.downcase
    self.match
  end

  def match
    if @word == @guess
      puts win
      exit
  elsif @word.include? "#{@guess}"
      self.update_dash
    else
      @counter += 1
      self.update_guessed_letters
      # self.update_ascii
    end
  end

  def game
    until @word_as_dashes.join == @word || @counter == 5
      guess
      puts update_ascii
      puts @word_as_dashes.join.capitalize
      puts "wrong guesses: #{@guessed_array}"
      next
    end
    if @word_as_dashes.join == @word
      puts win
    else
      puts "Better luck next time, Malfoy. You forgot about #{@word.capitalize}!"
    end

  end

  def update_ascii
    if @counter == 0
      puts ascii
    elsif @counter == 1
      puts ascii.tr('*', ' ')
    elsif @counter == 2
      puts ascii.tr('.*', ' ')
    elsif @counter == 3
      puts ascii.tr('+.*', ' ')
    elsif @counter == 4
      puts ascii.tr('o+.*', ' ')
    elsif @counter == 5
      puts ascii.tr(':o+.*', ' ')
    end
  end

  def update_dash
    @word_as_array.each_with_index do |letter, index|
      if letter == @guess
        @word_as_dashes[index] = @guess
      end
    end
  end

  def update_guessed_letters
    @guessed_array << @guess
  end

def win
  return %q{
           _             _.,----,
__  _.-._ / '-.         -  ,._  \)
|  `-)_   '-.   \       / < _ )/" )
/__    '-.   \   '-, ___(c-(6)=(6)
, `'.    `._ '.  _,'   >\    "  )
:;;,,'-._   '---' (  ( "/`. -='/
;:;;:;;,  '..__    ,`-.`)'- '--'
;';:;;;;;'-._ /'._|   Y/   _/' \
  '''"._ F    |  _/ _.'._   `\
         L    \   \/     '._  \
  .-,-,_ |     `.  `'---,  \_ _|
  //    'L    /  \,   ("--',=`)7
 | `._       : _,  \  /'`-._L,_'-._
 '--' '-.\__/ _L   .`'         './/
             [ (  /
              ) `(
              \__)
 "YOU WON! YER A WIZARD, HARRY!"}
end
end


new_game = WordGuess.new
