VALID_CHOICES = %w(rock paper scissors lizard spock)

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
    prompt("You can just enter the first letter or two: (r)ock, (sp)ock")
    choice = Kernel.gets.chomp.downcase

    choice = expand_shorthand(choice) if choice.length < 3

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end
  choice
end

def expand_shorthand(input)
  result = input
  unless input == 's'
    VALID_CHOICES.each do |option|
      result = option if option.start_with?(input)
    end
  end
  result
end

def win?(player1, player2)
  victory_condition = {
    'rock' => %w(lizard scissors),
    'paper' => %w(rock spock),
    'scissors' => %w(paper lizard),
    'lizard' => %w(spock paper),
    'spock' => %w(scissors rock)
  }
  victory_condition[player1].include?(player2)
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
  standings = %(
    Player wins = #{scores[:player]}
    Computer wins = #{scores[:computer]}
  )
  prompt(standings)
end

def display_final_result(scores)
  if scores[:player] == 5
    prompt("You are the GRAND WINNER!!")
  elsif scores[:computer] == 5
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

scores = {
  player: 0,
  computer: 0
}

prompt("Welcome to Rock Paper Scissors Lizard spock!")
prompt("The first to five wins becomes the Grand Winner.")

loop do
  clear_screen

  choice = user_move
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}! Computer chose #{computer_choice}!")

  display_game_result(choice, computer_choice)

  scores = update_scores(choice, computer_choice, scores)
  display_scores(scores)

  break if scores[:player] == 5 || scores[:computer] == 5

  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp

  break unless answer.downcase.start_with?('y')
end

display_final_result(scores)
prompt("Thanks for playing!")
