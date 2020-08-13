FACES = (2..10).to_a.map(&:to_s) + %w(A J Q K)
SUITS = %w(hearts spades clubs diamonds)

WIN = 21
DEALER_HALT = 17

ROUNDS_TO_VICTORY = 5

def new_deck
  deck = FACES.product(SUITS).map { |(face, suit)| "#{face} of #{suit}".upcase }
  deck.shuffle
end

def deal_card(deck, hand)
  random_card = deck.pop
  hand[random_card] = calculate_card_value(random_card, hand)
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

def calculate_card_value(card, hand)
  face = card.split[0]

  case face
  when 'K', 'Q', 'J' then 10
  when '2'..'10' then face.to_i
  when 'A'
    calculate_hand_value(hand) <= 10 ? 11 : 1
  end
end

def calculate_hand_value(hand)
  hand.values.sum
end

def player_turn(deck, hand)
  loop do
    loop do
      prompt "Do you want to (1) hit or (2) stay?"
      choice = gets.chomp.downcase

      case choice
      when '1', 'hit'
        deal_card(deck, hand)
        display_hand(hand, :player)
        break
      when '2', 'stay' then return :stay
      else prompt "That's not a valid answer."
      end
    end
    break if busted?(hand)
  end
end

def dealer_turn(deck, hand)
  draw_count = 0
  until calculate_hand_value(hand) >= DEALER_HALT || busted?(hand)
    deal_card(deck, hand)
    draw_count += 1
  end
  prompt "The dealer drew #{draw_count} cards."
  prompt "Press enter to determine the winner."
  gets.chomp
end

def busted?(hand)
  calculate_hand_value(hand) > WIN
end

def display_table(dealer, player, status='show')
  system 'cls'
  display_hand(player, :player)
  prompt ""
  case status
  when 'hide'
    dealer_card = dealer.first
    prompt "The dealer is showing a #{dealer_card[0]} [#{dealer_card[1]}+ pts]."
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
  hand.each_pair do |card, value|
    puts "   - #{card} (#{value})"
  end
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

def reset_scores
  { player: 0, dealer: 0 }
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
  if scores[:player] == ROUNDS_TO_VICTORY
    :player
  elsif scores[:dealer] == ROUNDS_TO_VICTORY
    :dealer
  end
end

def display_final_winner(scores)
  case calculate_final_winner(scores)
  when :player
    prompt "CONGRATULATIONS!!!! YOU ARE THE GAME WINNER!!!!"
  when :dealer
    prompt "You lost this match to the dealer. Good game."
  else prompt "This #{ROUNDS_TO_VICTORY}-game match had no winner."
  end
end

def prompt(msg)
  puts ">> #{msg}"
end

def welcome
  prompt "Welcome to Twenty-One!"


  prompt "Press enter to begin."
  gets.chomp
end

def play_again?(simple_continue = false)
  answer = ''

  if simple_continue
    prompt "Enter anything to continue to the next round (q to quit)."
    answer = gets.chomp.downcase
    return false if ['q', 'quit'].include?(answer)
  else
    possible_answers = ['y', 'yes', 'n', 'no', 'q', 'quit']
    loop do
      prompt "Shuffle and play again? (y/n)"
      answer = gets.chomp.downcase
      break if possible_answers.include?(answer)
      prompt "I don't understand that response. Try entering 'yes' or 'no'."
    end
  end
  simple_continue || answer.start_with?('y') ? true : false
end

loop do # main game, requires certain # of victories
  welcome
  scores = reset_scores

  loop do # single round of 21
    deck = new_deck
    player_hand = {}
    dealer_hand = {}

    deal_to_table(deck, dealer_hand, player_hand)

    display_table(dealer_hand, player_hand, 'hide')

    player_turn(deck, player_hand)
    if busted?(player_hand)
      prompt "You busted."
    else
      prompt "You chose to stay."
      dealer_turn(deck, dealer_hand)
      display_table(dealer_hand, player_hand)
      prompt "The dealer busted." if busted?(dealer_hand)
    end

    display_winner(player_hand, dealer_hand)

    scores = update_scores(scores, player_hand, dealer_hand)
    display_scores(scores)

    break if scores.has_value?(ROUNDS_TO_VICTORY)
    break unless play_again?(true)
  end

  display_final_winner(scores)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"
