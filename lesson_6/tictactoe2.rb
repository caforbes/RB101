EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

MIDDLE_SQUARE = 5
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7] # diagonals
]

TURN_OPTION = 'Alternate' # Player, Computer, Choose, Alternate, Loser
WINS_TO_VICTORY = 5

def prompt(msg)
  puts ">> #{msg}"
end

def display_welcome
  prompt "Welcome to TIC-TAC-TOE!"
  prompt "It's you versus the computer."
  prompt "The first to win #{WINS_TO_VICTORY} rounds wins the game!"
  prompt "Press enter to begin."
  gets.chomp
end

def joinor(arr, punct=', ', conjunction='or')
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
    square = gets.chomp
    square = square.to_i if square == square.to_i.to_s

    break if empty_squares(brd).include?(square)
    prompt "That's not a valid square to move!"
  end

  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  attack_option = find_at_risk_square(brd, COMPUTER_MARKER)
  defense_option = find_at_risk_square(brd, PLAYER_MARKER)

  square =  if attack_option then attack_option
            elsif defense_option then defense_option
            elsif brd[MIDDLE_SQUARE] == EMPTY_MARKER then MIDDLE_SQUARE
            else empty_squares(brd).sample
            end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(brd, attacker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(attacker) == 2
      at_risk = line.select { |sq| brd[sq] == EMPTY_MARKER }
      return at_risk.first unless at_risk.empty?
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

def play_game_round(board, current_player)
  loop do
    display_board(board)
    make_move!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
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
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_round_winner(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round!"
  else
    prompt "It's a tie!"
  end
end

def select_match_winner(scores)
  if scores[:player] == WINS_TO_VICTORY then 'Player'
  elsif scores[:computer] == WINS_TO_VICTORY then 'Computer'
  end
end

def display_match_winner(scores)
  if scores[:player] == WINS_TO_VICTORY
    prompt ""
    prompt "YOU WON THE GAME!!!!"
  elsif scores[:computer] == WINS_TO_VICTORY
    prompt ""
    prompt "The computer beat you!!!!"
  end
end

def update_scores(score_hsh, brd)
  case detect_winner(brd)
  when 'Player'
    score_hsh[:player] += 1
  when 'Computer'
    score_hsh[:computer] += 1
  end
  score_hsh
end

def display_scores(score_hsh)
  player = score_hsh[:player]
  computer = score_hsh[:computer]
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

def update_first_player(current_first_player, board)
  case TURN_OPTION
  when 'Choose' then select_first_player
  when 'Alternate' then alternate_player(current_first_player)
  when 'Loser'
    alternate_player(detect_winner(board)) if someone_won?(board)
  end
end

def alternate_player(player)
  case player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

def prompt_for_next_game(game_type)
  loop do
    case game_type
    when 'round'
      prompt "Press enter to play the next game. (q to quit)"
    when 'match'
      prompt "Play another match? (y or n)"
    end

    answer = gets.chomp.downcase
    break answer if ['', 'y', 'n', 'q', 'yes', 'no', 'quit'].include?(answer)

    prompt "I don't understand that answer."
  end
end

display_welcome

loop do

  scores = { player: 0, computer: 0 }

  plays_first = case TURN_OPTION
                when 'Player', 'Computer' then TURN_OPTION
                else select_first_player
                end

  loop do
    board = initialize_board

    play_game_round(board, plays_first)

    display_board(board)

    display_round_winner(board)

    scores = update_scores(scores, board)
    display_scores(scores)

    winner = select_match_winner(scores)
    display_match_winner(scores) if winner
    break if winner

    quit = prompt_for_next_game('round')
    break if ['q', 'quit'].include?(quit)

    plays_first = update_first_player(plays_first, board)
  end

  again = prompt_for_next_game('match')
  break unless ['y', 'yes'].include?(again)
end

prompt "Thanks for playing TIC-TAC-TOE! Goodbye!"
