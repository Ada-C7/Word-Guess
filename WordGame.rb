require 'faker'
require 'colorize'

class Art
    def appear(ascii_artfile)
        File.open(ascii_artfile) do |f|
            f.each_line do |line|
                puts line
            end
        end
    end
end

class Game
    attr_reader :theword

    def initialize
        @stringword = Faker::Hipster.words.sample.downcase
        @player_lives = 5
        @asciiart = Art.new.appear('./initial_attempt.txt')
        @attempt_1 = Art.new
        @attempt_2 = Art.new
        @attempt_3 = Art.new
        @attempt_4 = Art.new
        @lost_art2 = Art.new
        @won_art = Art.new
    end

    def game
        dashes
        @userguesses = []

        until @arrayword == @answer

            if @player_lives == 4
                @asciiart = @attempt_1.appear('./attempt_1.txt')
            elsif @player_lives == 3
                @asciiart = @attempt_2.appear('./attempt_2.txt')
            elsif @player_lives == 2
                @asciiart = @attempt_3.appear('./attempt_3.txt')
            elsif @player_lives == 1
                @asciiart = @attempt_4.appear('./attempt_4.txt')
            end

            @letter = ''

            print 'Guess a letter if you dare: '

            until ('a'..'z').cover?(@letter) && !@userguesses.include?(@letter)
                @letter = gets.chomp.downcase

                if @userguesses.include?(@letter)
                    puts "You've already given me that letter!"
                    puts 'Guess Again (ノಠ益ಠ)ノ彡'.colorize(:yellow)

                elsif !('a'..'z').cover?(@letter)
                    puts 'I only understand letters you fool!'
                    puts 'Guess Again (ノಠ益ಠ)ノ彡'.colorize(:yellow)
              end

            end

            @userguesses << @letter
            puts

            @arrayword = @stringword.split('')

            if @arrayword.include?(@userguesses.last)

                @arrayword.each_with_index do |_val, index|
                    @answer[index] = if @arrayword[index] == @userguesses.last
                                         @userguesses.last
                                     elsif !(@answer[index] == '_')
                                         @answer[index]
                                     end

                    @answer[index] = '_' if @answer[index].nil?
                end
            else
                puts 'Wrong!'.colorize(:red)
                lose_life(@userguesses)

            end
            puts 'You have guessed: ' + @userguesses.join(', ').upcase
            puts
            puts @answer.join(' ').upcase

            next unless @player_lives == 0
            @asciiart = @lost_art2.appear('./lost2.txt')
            puts 'Boo!'.colorize(:red)
            puts 'I spooked ya ( ͡° ͜ʖ ͡°)'.colorize(:yellow)
            puts 'The word was ' + @stringword.upcase.colorize(:magenta)
            break
        end
  end

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*
    private

    def lose_life(letter)
        if !@stringword.include?(@letter) && !@arrayword.include?(letter)
            @player_lives -= 1
        end
    end

    def dashes
        @answer = []
        @stringword.length.to_i.times do
            @answer << '_'
        end
        puts @answer.join(' ')
    end
end

gameword = Game.new

puts 'Guess the word or pay the consiquences  ლ(ಠ益ಠ)ლ'.colorize(:red)

gameword.game
