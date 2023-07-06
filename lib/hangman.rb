require_relative 'display'

class Hangman

  def initialize (word = nil, guessed_letters = [])
    @word = word
    @guessed_letters = guessed_letters
    @display = Display.new()
  end

  def pick_random_word
    file = File.new('google-10000-english-no-swears.txt', 'r')
    words = file.readlines.filter { |word| word.chomp.length > 4 && word.chomp.length < 13 }.map {|word| word.chomp!}

    random_number = rand(0..words.length-1)
    @word = words[random_number].split("")
  end

  def display_number_of_letters
    string = ""
    unless @word == nil
      @word.length.times do
        string.concat('_ ')
      end
    end
    string
  end
end

puts "Hangman initialized!"

game = Hangman.new
game.pick_random_word()
game.display_number_of_letters
