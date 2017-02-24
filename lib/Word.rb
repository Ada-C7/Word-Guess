class Word
  attr_reader :new_word, :spaces
  def initialize
    @spaces = []
    categories = {
      "Game of Thrones" => Faker::GameOfThrones.character,
      "Greek Gods" => Faker::Ancient.god,
      "Star Wars" => Faker::StarWars.quote,
      "Harry Potter" => Faker::HarryPotter.quote
    }
    @category = categories.keys.sample
    @new_word = categories[@category].upcase
    create_spaces
  end

  def new_word
    @new_word
  end

  def spaces
    @spaces
  end

  def update_spaces(player_guess)
    # UPDATE SPACES
    # puts "before updating spaces, spaces is #{@spaces}"
    word_array = @new_word.split("")
    word_array.each_with_index do |letter, index |
      if letter == player_guess
        @spaces[index] = letter
      end
    end
  end

  def fill_in_punctuation_spaces
    word_array = @new_word.split("")
    word_array.each_with_index do |character, index |
      if ["?", "!", ",", ".", "-"].include?(character)
        @spaces[index] = character
      end
    end
  end

  def display_category
    puts
    puts "CATEGORY: #{@category}"
  end

  def create_spaces
    # CREATE SPACES
    words = @new_word.split(" ")
    # puts "@words is #{words}"
    words[0..-2].each do |word|
      word.length.times do
        @spaces << "_"
      end
      @spaces << " "
    end
    words[-1].length.times do
      @spaces << "_"
    end

    fill_in_punctuation_spaces
    # puts "@spaces is #{@spaces}"
    # puts "@spaces.length is #{@spaces.length}"
    # puts "created initial spaces"
  end

  def display_spaces
    # DISPLAY SPACES
    puts
    @spaces.each do |space|
      print space + "  "
    end
    puts
    # puts "displaying spaces"
    display_category
  end

end # end of Word class
