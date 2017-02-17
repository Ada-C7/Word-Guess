require 'faker'

class Word
    attr_reader :theword

    def initialize
        @theword = 'ada' # Faker::Cat.name.downcase
    end

    def dashes
        @theword.length.to_i.times do
            @answer = []
            @answer << '_'
            print '_ '
        end
    end

    def guess
        @letter = ''

        until ('a'..'z').cover?(@letter)
            print "\nPlease guess a letter! (a..z): "
            @letter = gets.chomp.downcase
        end

        @userguess = []
        @userguess << @letter
        puts 'You have guessed ' + @userguess.to_s + 'thus far'
        @gameword = @theword.split('')

        if @gameword.include?(@userguess.last)

            @gameword.each do |i|
                @answer[i.to_i] = @userguess.last if @theword[i.to_i] == @userguess.last
            end
        else
            puts 'prolly broken'
        end
    end
end

class Art
    attr_reader :theart

    def initialize(asciiart)
        @theart = asciiart
    end
end

gameword = Word.new

gameword.dashes
gameword.guess
