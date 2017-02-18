class WordGuessArt

  def initialize
    @art_file = './turtle1.txt'
  end

  def print_art
    File.open(@art_file) do |f|
      f.each_line do |line|
        puts line
      end
    end
  end

  #update_art method will rewrite the @art_file variable to the txt file we want or portion of text file we want
  def update_art(max_wrong_guesses)
    case max_wrong_guesses
    when 11
      @art_file = './turtle2.txt'
    when 10
      @art_file = './turtle3.txt'
    when 9
      @art_file = './turtle4.txt'
    when 8
      @art_file = './turtle5.txt'
    when 7
      @art_file = './turtle6.txt'
    when 6
      @art_file = './turtle7.txt'
    when 5
      @art_file = './turtle8.txt'
    when 4
      @art_file = './turtle9.txt'
    when 3
      @art_file = './turtle10.txt'
    when 2
      @art_file = './turtle11.txt'
    when 1
      @art_file = './turtle12.txt'
    end
  end

end
