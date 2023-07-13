class Display
  def prompt(message)
    puts message
    gets.chomp
  end

  def display_word(word_array)
    puts word_array.join(' ')
  end

  def game_over_text
    puts 'Game over, better luck next time!'
  end

  def win_text
    puts 'Congratulations, you win!'
  end

  def prompt_guess(guessed_letters)
    puts 'Guess a letter in the word, you can also type save to save the game or exit to exit.'
    puts "You have already guessed these letters: #{guessed_letters.join(", ")}"
    gets.chomp
  end

  def invalid_guess
    puts 'Invalid input, guess must be a letter between a-z. Try again!'
  end

  def correct_guess
    puts 'The guessed letter is in the word!'
  end

  def incorrect_guess
    puts 'The guessed letter is not in the word!'
  end

  def save_text
    puts 'Saving game'
  end

  def exit_text
    puts 'Exiting game'
  end
end

