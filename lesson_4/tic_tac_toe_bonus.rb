# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!
require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = '0'.freeze
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "First one to 5 wins"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', word = 'or')
  if arr.size == 1
    arr.join(delimiter)
  elsif arr.size == 2
    arr.join(' ')
  else
    arr[0..(arr.size - 2)].join(delimiter) +
      "#{delimiter}#{word} #{arr.last}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  computer_defense(brd)
  #square = empty_squares(brd).sample

  #brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def computer_defense(brd)

  WINNING_LINES.each do |line|
    
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).index(' ') != nil
      brd[line[brd.values_at(*line).index(' ')]] = COMPUTER_MARKER   
      return
    end
  end

  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_round(round, player_score, computer_score)
  prompt("End of round: #{round}")
  prompt("Player Score: #{player_score}, Computer Score: #{computer_score}")
end

def display_winner(player_score, computer_score)
  if player_score == 5
    prompt("Player won the match #{player_score} to #{computer_score}")
  else
    prompt("Computer won this match #{computer_score} to #{player_score}")
  end
end

def game_winner?(player_score, computer_score)
  player_score == 5 || computer_score == 5
end

# START #

player_score = 0
computer_score = 0
round_number = 1

loop do
  loop do
    board = intialize_board

    loop do
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
      player_score += 1 if detect_winner(board) == 'Player'
      computer_score += 1 if detect_winner(board) == 'Computer'
    else
      prompt("It's a tie!")
    end

    break if game_winner?(player_score, computer_score)

    display_round(round_number, player_score, computer_score)
    prompt("Press Enter to Continue...")
    gets.chomp
    round_number += 1
  end

  display_winner(player_score, computer_score)
  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Good Bye.")
