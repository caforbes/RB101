def new_deck
  faces = (2..10).to_a.map(&:to_s) + %w(A J Q K)
  suits = %w(hearts spades clubs diamonds)

  faces.product(suits).map { |(face, suit)| "#{face} of #{suit}".upcase }
end

def deal_to_table(deck, dealer, player)
  2.times { deal_card(deck, player) }
  2.times { deal_card(deck, dealer) }
end

def deal_card(deck, hand)
  random_card = deck.sample

  hand[random_card] = calculate_card_value(random_card, hand)
  deck.delete(random_card)
  # add it to the hand along with card value
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
    stay = false
    loop do
      prompt "Do you want to (1) hit or (2) stay?"
      choice = gets.chomp.downcase

      case choice
      when '1', 'hit'
        deal_card(deck, hand)
        display_hand(hand, 'Player')
        break
      when '2', 'stay'
        stay = true
        break
      else
        prompt "That's not a valid answer."
      end
    end

    break if stay || busted?(hand)
  end
end

def dealer_turn(deck, hand)
  draw_count = 0
  loop do
    deal_card(deck, hand)
    draw_count += 1
    break if calculate_hand_value(hand) >= 17 || busted?(hand)
  end
  prompt "The dealer drew #{draw_count} cards."
  prompt "Press enter to determine the winner."
  gets.chomp
end

def busted?(hand)
  calculate_hand_value(hand) > 21
end

def display_welcome
  prompt "Welcome to Twenty-One!"
  prompt "Press enter to begin."
  gets.chomp
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

def display_winner(winner)
  case winner
  when 'Player'
    prompt "You won!!"
  when 'Dealer'
    prompt "The dealer won!"
  else
    prompt "There is no winner of this game."
  end
end

def prompt(msg)
  puts ">> #{msg}"
end

display_welcome

loop do
  deck = new_deck

  player_hand = {}
  dealer_hand = {}

  deal_to_table(deck, player_hand, dealer_hand)

  display_table(dealer_hand, player_hand, 'hide')

  player_turn(deck, player_hand)
  if busted?(player_hand)
    prompt "You busted. Press enter to end your turn."
    gets.chomp
  else
    dealer_turn(deck, dealer_hand)
  end


  display_table(dealer_hand, player_hand)

  prompt "The dealer busted." if busted?(dealer_hand)
  display_winner(calculate_winner(player_hand, dealer_hand))

  prompt "Play again? (y to shuffle and restart)"
  restart = gets.chomp.downcase
  break unless ['y', 'yes'].include?(restart)
end
