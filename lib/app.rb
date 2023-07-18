require_relative 'hangman'

puts 'Hangman initialized!'
puts ''

game = Hangman.new
game.pick_random_word
playing = true

while playing
  puts 'Type new to start a new game, load to load a saved game or exit to exit.'
  input = gets.chomp
  case input.downcase
  when 'new'
    puts 'New game started'
    puts ''
    game.play_game
    playing = false
  when 'load'
    game.load_game
    game.play_game
    playing = false
  when 'exit'
    puts 'Bye!'
    playing = false
  end
end