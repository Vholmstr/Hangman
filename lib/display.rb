class Display
  def prompt(message)
    puts message
    gets.chomp
  end

  def display_word(word_array)
    puts "\033[1;44m#{word_array.join(' ')}\033[0m"
    puts ''
  end

  def game_over_text(word)
    puts ''
    puts "Game over, the correct word was: #{word}."
    puts 'Better luck next time!'
  end

  def win_text
    puts 'Congratulations, you win!'
  end

  def prompt_guess()
    puts ''
    puts 'Guess a letter in the word, you can also type save to save the game or exit to exit.'
    guess = gets.chomp
    20.times do
      puts ''
    end
    guess
  end

  def display_guessed_letters(guessed_letters)
    puts "You have already guessed these letters: #{guessed_letters.join(", ")}"
  end

  def invalid_guess
    puts 'Invalid guess, guess must be a letter between a-z. Try again!'
  end

  def correct_guess
    puts "\033[32mGood guess!\033[0m"
  end

  def incorrect_guess
    puts "\033[31mUnlucky!\033[0m"
  end

  def duplicate_guess
    puts 'Letter already guessed, try again!'
  end

  def display_turns(turns)
    puts "Guesses left:#{turns}"
  end

  def save_text
    puts "\033[32mSaving game!\033[0m"
  end

  def exit_text
    puts 'Exiting game, thank you for playing!'
  end

  def create_save_prompt
    prompt('Choose a name for your save')
  end

  def load_game_prompt
    prompt('Write the name of your saved game')
  end
end

