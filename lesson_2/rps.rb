VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_SHORTHAND = %w(r p sc l sp)

WIN_CONDITIONS = {
  'rock' => %w(lizard scissors),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

ENDS_AT = 5

def prompt(msg)
  Kernel.puts(">> #{msg}")
end

def clear_screen
  system('clear') || system('cls')
end

def user_move
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(For short, you can enter: #{VALID_SHORTHAND.join(', ')})")
    choice = Kernel.gets.chomp.downcase

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_SHORTHAND.include?(choice)
      choice = expand_shorthand(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end
  choice
end

def expand_shorthand(input)
  VALID_CHOICES[VALID_SHORTHAND.index(input)]
end

def win?(player1, player2)
  WIN_CONDITIONS[player1].include?(player2)
end

def match_over?(scores)
  scores[:player] == ENDS_AT || scores[:computer] == ENDS_AT
end

def display_game_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost...")
  else
    prompt("It was a tie!")
  end
end

def display_scores(scores)
  standings = %(Standings:

    Player wins = #{scores[:player]}
    Computer wins = #{scores[:computer]}
  )
  prompt(standings)
end

def display_final_result(scores)
  display_scores(scores)

  if scores[:player] == ENDS_AT
    prompt("You are the GRAND WINNER!!")
  elsif scores[:computer] == ENDS_AT
    prompt("Computer is the GRAND WINNER!!")
  else
    prompt("There is no grand winner. Play more rounds next time!")
  end
end

def update_scores(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
  scores
end

def quit?(input)
  true if input.downcase == 'q'
end

def restart?(input)
  true if input.downcase == 'y'
end

clear_screen
intro = %(=== Welcome to Rock Paper Scissors Lizard Spock! ===

  You will play vs the Computer.
  The first to #{ENDS_AT} wins takes the match and becomes the Grand Winner.

  Enter any key to start playing!
)
prompt(intro)
Kernel.gets.chomp

loop do
  scores = {
    player: 0,
    computer: 0
  }

  loop do # round
    clear_screen
    display_scores(scores)

    choice = user_move
    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}! Computer chose #{computer_choice}!")

    display_game_result(choice, computer_choice)

    scores = update_scores(choice, computer_choice, scores)

    break if match_over?(scores)

    prompt("Press enter to start the next round. (Q to quit)")
    answer = Kernel.gets.chomp
    break if quit?(answer)
  end

  display_final_result(scores)

  prompt("Do you want to play a new game? (Y to restart)")
  answer = Kernel.gets.chomp
  break unless restart?(answer)
end

prompt("Thanks for playing!")
