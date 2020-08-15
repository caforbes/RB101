FACES = (2..10).to_a.map(&:to_s) + %w(A J Q K)
SUITS = %w(hearts spades clubs diamonds)

WIN_THRESHOLD = 21
DEALER_HALT = 17

ROUNDS_TO_VICTORY = 5

def new_deck
  deck = FACES.product(SUITS)
  deck.map! do |face, suit|
    { face: face, suit: suit }
  end
  deck.shuffle
end

def deal_card(deck, hand)
  drawn_card = deck.pop
  drawn_card[:points] = calculate_card_value(drawn_card, hand)
  hand.push(drawn_card)
end

def calculate_card_value(card, hand)
  face = card[:face]

  case face
  when 'K', 'Q', 'J' then 10
  when '2'..'10' then face.to_i
  when 'A'
    calculate_hand_value(hand) <= 10 ? 11 : 1
  end
end

def calculate_hand_value(hand)
  hand.reduce(0) do |point_sum, card|
    point_sum + card[:points]
  end
end

def deal_to_table(deck, dealer, player)
  system 'cls'

  prompt "Dealing to player..."
  sleep 1
  prompt "Dealing to dealer..."
  sleep 1

  2.times do
    deal_card(deck, player)
    deal_card(deck, dealer)
  end
end

def player_turn(deck, hand)
  loop do
    case hit_or_stay
    when :hit
      deal_card(deck, hand)
      display_hand(hand, :player)
    else break
    end
    break if busted?(hand)
  end
end

def hit_or_stay
  loop do
    prompt "Do you want to (1) hit or (2) stay?"
    choice = gets.chomp.downcase

    case choice
    when '1', 'hit' then return :hit
    when '2', 'stay' then return :stay
    else prompt "That's not a valid answer."
    end
  end
end

def dealer_turn(deck, hand)
  until calculate_hand_value(hand) >= DEALER_HALT || busted?(hand)
    deal_card(deck, hand)
  end
  confirm_dealer_turn(hand)
end

def confirm_dealer_turn(hand)
  prompt "The dealer drew #{hand.size - 2} cards."
  prompt "Press enter to determine the winner."
  gets.chomp
end

def play_game_round(deck, player, dealer)
  player_turn(deck, player)
  if busted?(player)
    prompt "You busted."
  else
    prompt "You chose to stay."

    dealer_turn(deck, dealer)

    display_table(dealer, player)
    prompt "The dealer busted." if busted?(dealer)
  end
end

def card_name(card)
  "#{card[:face]} of #{card[:suit]}".upcase
end

def display_table(dealer, player, status='show') # 'show', 'hide'
  system 'cls'
  display_hand(player, :player)
  prompt ""
  case status
  when 'hide'
    dealer_card = dealer.first
    points = dealer_card[:points]
    prompt "The dealer is showing a #{card_name(dealer_card)} [#{points}+ pts]."
  else
    display_hand(dealer, :dealer)
  end
  prompt ""
end

def display_hand(hand, name)
  case name
  when :player
    prompt "You have this hand [#{calculate_hand_value(hand)} pts]:"
  when :dealer
    prompt "The dealer has this hand [#{calculate_hand_value(hand)} pts]:"
  end
  hand.each do |card|
    puts "   - #{card_name(card)} (#{card[:points]})"
  end
end

def busted?(hand)
  calculate_hand_value(hand) > WIN_THRESHOLD
end

def calculate_winner(player, dealer)
  player_pts = calculate_hand_value(player)
  dealer_pts = calculate_hand_value(dealer)

  if busted?(player) then :dealer
  elsif busted?(dealer) then :player
  elsif player_pts > dealer_pts then :player
  elsif dealer_pts > player_pts then :dealer
  end
end

def display_winner(player, dealer)
  case calculate_winner(player, dealer)
  when :player
    prompt "You won this round!!"
  when :dealer
    prompt "The dealer won this round!"
  else
    prompt "This round was a tie."
  end
end

def update_scores(scores, player, dealer)
  winner = calculate_winner(player, dealer)
  scores[winner] += 1 if winner
  scores
end

def display_scores(scores)
  message = []
  scores.each do |player, score|
    message.push "#{player.to_s.upcase} = #{score}"
  end
  prompt ''
  prompt message.join(' | ')
  prompt ''
end

def calculate_final_winner(scores)
  if scores[:player] == ROUNDS_TO_VICTORY then :player
  elsif scores[:dealer] == ROUNDS_TO_VICTORY then :dealer
  end
end

def display_final_winner(scores)
  case calculate_final_winner(scores)
  when :player
    prompt "CONGRATULATIONS!!!! YOU ARE THE GAME WINNER!!!!"
  when :dealer
    prompt "You lost this match to the dealer. Good game."
  else prompt "This first-to-#{ROUNDS_TO_VICTORY} match ended early."
  end
end

def prompt(msg)
  puts ">> #{msg}"
end

def user_get_ready
  prompt "The first to win #{ROUNDS_TO_VICTORY} games takes the match."
  prompt "Press enter to begin."
  gets.chomp
end

def play_again?(simple_continue = false)
  answer = ''

  if simple_continue
    prompt "Enter anything to continue to the next round (q to quit)."
    answer = gets.chomp.downcase
  else
    possible_answers = ['y', 'yes', 'n', 'no', 'q', 'quit']
    loop do
      prompt "Shuffle and play again? (y/n)"
      answer = gets.chomp.downcase
      break if possible_answers.include?(answer)
      prompt "I don't understand that response. Try entering 'yes' or 'no'."
    end
  end

  return false if ['q', 'quit'].include?(answer)
  simple_continue || answer.start_with?('y')
end

prompt "Welcome to Twenty-One!"

loop do # main game loop
  user_get_ready
  scores = { player: 0, dealer: 0 }

  loop do # single round of 21
    deck = new_deck
    player_hand = []
    dealer_hand = []

    deal_to_table(deck, dealer_hand, player_hand)
    display_table(dealer_hand, player_hand, 'hide')

    play_game_round(deck, player_hand, dealer_hand)

    display_winner(player_hand, dealer_hand)

    scores = update_scores(scores, player_hand, dealer_hand)
    display_scores(scores)

    break if scores.value?(ROUNDS_TO_VICTORY)
    break unless play_again?(true)
  end

  display_final_winner(scores)

  break unless play_again?
  system 'cls'
end

prompt "Thanks for playing Twenty-One!"
