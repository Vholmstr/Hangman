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
    @word = words[random_number].split('')
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

  def update_display_array
    #Compares the guessed letters to the word and updates the display array accordingly
    @word.each_with_index do |letter, i|
      if @guessed_letters.include?(letter)
        @display_array[i] = letter.upcase
      end
    end
  end

  def sanitize_guess(string)
    # check if the string is only one letter and in the alphabet or save or exit
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

  def guess_letter
    guess = @display.prompt_guess()
    guess = sanitize_guess(guess)
    if guess.nil?
      @display.invalid_guess
      return nil
    elsif guess == 'exit'
      return 'exit'
    elsif guess == 'save'
      return 'save'
    elsif @guessed_letters.join('').include?(guess)
      @display.duplicate_guess
      return nil
    elsif guess.length == 1
      # TO DO!!! Write logic for handling a guess
      @guessed_letters.push(guess)
      update_display_array()
      if @word.join('').include?(guess)
        @display.correct_guess
        return false
      else
        @display.incorrect_guess
      end
      return 'guess'
    end
  end

  # Only for testing purposes!!!!!!!!!!!!!!!!!!!
  def show_word
    # puts @word.join('')
    puts @display_array.join(' ')
  end

  def new_game(turns)
    turns_left = turns
    while turns_left.positive?
      if @display_array.index('_').nil?
        @display.display_word(@display_array)
        @display.win_text
        break
      end
      @display.display_guessed_letters(@guessed_letters)
      @display.display_turns(turns_left)
      @display.display_word(@display_array)
      case guess_letter()
      when 'guess'
        turns_left -= 1
        if turns_left.zero?
          @display.game_over_text(@word.join(''))
        end
      when 'save'
        # save game
        @display.save_text
        turns_left = 0
      when 'exit'
        # Exits game
        @display.exit_text
        turns_left = 0
      end
    end
  end
end

puts "Hangman initialized!"

game = Hangman.new

#Game loop
game.pick_random_word()
game.update_display_array()
game.new_game(10)