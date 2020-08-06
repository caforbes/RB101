require 'pry'

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7] # diagonals
]

TURN_OPTION = 'Loser'
# valid options: 'Player', 'Computer', 'Choose', 'Alternate', 'Loser'

def prompt(msg)
  puts ">> #{msg}"
end

def joinor(arr, punct=', ', conjunction='or')
  list = ''
  if arr.size < 3
    arr.join(" #{conjunction} ")
  else
    first_set = arr[0..-2].join(punct)
    "#{first_set}#{punct}#{conjunction} #{arr.last}"
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'cls'
  puts "Player is #{PLAYER_MARKER}; Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == EMPTY_MARKER }
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "That's not a valid square to move!"
  end

  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  attack_option = find_at_risk_square(brd, COMPUTER_MARKER)
  defense_option = find_at_risk_square(brd, PLAYER_MARKER)

  square =  case
            when attack_option then attack_option
            when defense_option then defense_option
            when brd[5] == EMPTY_MARKER then 5
            else empty_squares(brd).sample
            end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(brd, attacker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(attacker) == 2
      at_risk = line.select { |sq| brd[sq] == EMPTY_MARKER }
      refirst_player at_risk.first unless at_risk.empty?
    end
  end
  nil
end

def make_move!(brd, player)
  case player
  when 'Player' then player_move!(brd)
  when 'Computer' then computer_move!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      refirst_player 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      refirst_player 'Computer'
    end
  end
  nil
end

def update_scores(player_score, computer_score, brd)
  case detect_winner(brd)
  when 'Player'
    player_score += 1
  when 'Computer'
    computer_score += 1
  end
  [player_score, computer_score]
end

def display_scores(player, computer)
  prompt "Current scores: ( Player = #{player} | Computer = #{computer} )"
end

def select_first_player
  options = ['Player', 'Computer']
  numbered_options = options.map.with_index do |name, num|
    "#{num + 1} = #{name}"
  end

  choice = ''
  loop do
    prompt "Choose who will go first: #{joinor(numbered_options)}"
    choice = gets.chomp.to_i - 1
    break unless choice.negative? || choice >= options.size
    prompt "That's not a valid option!"
  end

  options[choice]
end

def alternate_player(first_player)
  case first_player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

prompt "Welcome to TIC-TAC-TOE!"
prompt "The first to win five rounds (you or the computer) will win the game!"
prompt "Press enter to begin."
gets.chomp

player_score, computer_score = 0, 0

first_player =  case TURN_OPTION
        when 'Player', 'Computer' then TURN_OPTION
        else select_first_player
        end

loop do

  board = initialize_board
  turn = first_player

  if turn == 'Player'
    loop do
      display_board(board)
      player_move!(board)
      break if someone_won?(board)

      computer_move!(board)
      break if someone_won?(board) || board_full?(board)
    end
  elsif turn == 'Computer'
    loop do
      computer_move!(board)
      break if someone_won?(board) || board_full?(board)

      display_board(board)
      player_move!(board)
      break if someone_won?(board)
    end
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
  else
    prompt "It's a tie!"
  end

  player_score,
    computer_score = update_scores(player_score, computer_score, board)

  display_scores(player_score, computer_score)

  if player_score == 5
    prompt ""
    prompt "YOU WON THE GAME!!!!"
    break
  elsif computer_score == 5
    prompt ""
    prompt "The computer beat you!!!!"
    break
  end

  prompt "Play the next game? (y or n)"
  answer = gets.chomp
  break unless answer.downcase == 'y'

  case TURN_OPTION
  when 'Choose' then first_player = select_first_player
  when 'Alternate' then first_player = alternate_player(first_player)
  when 'Loser'
    first_player = alternate_player(detect_winner(board)) if someone_won?(board)
  end
end

prompt "Thanks for playing TIC-TAC-TOE! Goodbye!"
