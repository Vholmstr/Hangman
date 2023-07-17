class Display
  def prompt(message)
    puts message
    gets.chomp
  end

  def display_word(word_array)
    puts word_array.join(' ')
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
    puts ''
    guess
  end

  def display_guessed_letters(guessed_letters)
    puts "You have already guessed these letters: #{guessed_letters.join(", ")}"
  end

  def invalid_guess
    puts 'Invalid guess, guess must be a letter between a-z. Try again!'
  end

  def correct_guess
    puts 'Good guess!'
  end

  def incorrect_guess
    puts 'No luck!'
  end

  def duplicate_guess
    puts 'Letter already guessed, try again!'
  end

  def display_turns(turns)
    puts "Guesses left:#{turns}"
  end

  def save_text
    puts 'Saving game'
  end

  def exit_text
    puts 'Exiting game, thank you for playing!'
  end
end

