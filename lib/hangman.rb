require_relative 'display'

class Hangman

  def initialize (word = nil, guessed_letters = [])
    @word = word
    @display_array = []
    @guessed_letters = guessed_letters
    @display = Display.new()
    @game_ongoing = true
  end

  def pick_random_word
    # Save the words that are between 5-12 letters as an array
    file = File.new('google-10000-english-no-swears.txt', 'r')
    words = file.readlines.filter { |word| word.chomp.length > 4 && word.chomp.length < 13 }.map {|word| word.chomp!}

    # Picks a random number and uses it to select a word from the array
    random_number = rand(0..words.length-1)
    @word = words[random_number].split("")
    reset_display_array()
  end

  def reset_display_array
    # Updates the display array to match the numbers of letters in the word
    unless @word == nil
      @display_array = []
      @word.length.times do
        @display_array.push('_')
      end
    end
  end

  def sanitize_guess(string)
    if string.downcase == 'exit'
      string.downcase
    elsif string.downcase == 'save'
      string.downcase
    elsif string.length == 1 && string.downcase.match?(/[a-z]/)
      string.downcase
    else
      nil
    end
  end

  def guess_letter(guess)
    guess = sanitize_guess(guess)
    p guess
    if guess.nil?
      puts 'Faulty guess!'
    else
      puts 'Success!!'
    end
  end

  # Only for testing purposes!!!!!!!!!!!!!!!!!!!
  def show_word
    puts @word.join('')
    puts @display_array.join(' ')
  end
end

puts "Hangman initialized!"

game = Hangman.new

#Game loop
game.pick_random_word()
game.show_word()
game.guess_letter('W')
game.guess_letter('EXIT')
game.guess_letter('save')
game.guess_letter("-")