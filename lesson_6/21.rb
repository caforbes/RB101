FACES = (2..10).to_a.map(&:to_s) + %w(A J Q K)
SUITS = %w(hearts spades clubs diamonds)

WIN = 21
DEALER_HALT = 17

def new_deck
  deck = FACES.product(SUITS).map { |(face, suit)| "#{face} of #{suit}".upcase }
  deck.shuffle
end

def deal_card(deck, hand)
  random_card = deck.pop
  hand[random_card] = calculate_card_value(random_card, hand)
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
        display_hand(hand, 'Player')
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
  display_hand(player, 'Player')
  prompt ""
  case status
  when 'hide'
    dealer_card = dealer.first
    prompt "The dealer is showing a #{dealer_card[0]} [#{dealer_card[1]}+ pts]."
  else
    display_hand(dealer, 'Dealer')
  end
  prompt ""
end

def display_hand(hand, name)
  case name
  when 'Player'
    prompt "You have this hand [#{calculate_hand_value(hand)} pts]:"
  when 'Dealer'
    prompt "The dealer has this hand [#{calculate_hand_value(hand)} pts]:"
  end
  hand.each_pair do |card, value|
    puts "   - #{card} (#{value})"
  end
end

def calculate_winner(player, dealer)
  player_pts = calculate_hand_value(player)
  dealer_pts = calculate_hand_value(dealer)

  if busted?(player) then 'Dealer'
  elsif busted?(dealer) then 'Player'
  elsif player_pts > dealer_pts then 'Player'
  elsif dealer_pts > player_pts then 'Dealer'
  end
end

def display_winner(player, dealer)
  case calculate_winner(player, dealer)
  when 'Player'
    prompt "You won!!"
  when 'Dealer'
    prompt "The dealer won!"
  else
    prompt "It was a tie."
  end
end

def prompt(msg)
  puts ">> #{msg}"
end

def play_again?
  prompt "Play again? (Enter y to shuffle and restart)"
  answer = gets.chomp.downcase
  ['y', 'yes'].include?(answer)
end

prompt "Welcome to Twenty-One! Press enter to begin."
gets.chomp

loop do
  deck = new_deck
  player_hand = {}
  dealer_hand = {}

  2.times { deal_card(deck, player_hand) }
  2.times { deal_card(deck, dealer_hand) }

  display_table(dealer_hand, player_hand, 'hide')

  player_turn(deck, player_hand)

  if busted?(player_hand)
    prompt "You busted."
  else
    dealer_turn(deck, dealer_hand)
    display_table(dealer_hand, player_hand)
    prompt "The dealer busted." if busted?(dealer_hand)
  end
  display_winner(player_hand, dealer_hand)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One!"
