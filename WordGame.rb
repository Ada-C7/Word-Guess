require 'faker'

class Word
    attr_reader :theword

    def initialize
        @theword = Faker::Cat.name
    end

    def dashes
        @theword.length.to_i.times do
            print '_ '
        end
    end

    def guess
        @userguess = []
        @userguess << gets.chomp
        puts 'You have guessed ' + @userguess.to_s + 'thus far'
        @gameword = @theword.split('')

        if @gameword.include?(@userguess.last)
            puts 'yeee'
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
