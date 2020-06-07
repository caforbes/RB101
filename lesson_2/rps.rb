VALID_CHOICES = %w(rock paper scissors lizard Spock)

def prompt(msg)
  Kernel.puts(">> #{msg}")
end

def expand_shorthand(input)
  result = input
  VALID_CHOICES.each do |option|
    result = option if option.start_with?(input)
  end
  result
end

def win?(player1, player2)
  victory_condition = {
    'rock' => %w(lizard scissors),
    'paper' => %w(rock Spock),
    'scissors' => %w(paper lizard),
    'lizard' => %w(Spock paper),
    'Spock' => %w(scissors rock)
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

def display_final_result(scores)
  if scores[:player] == 5
    prompt("You are the GRAND WINNER!!")
  elsif scores[:computer] == 5
    prompt("Computer is the GRAND WINNER!!")
  else
    "Final result: #{match_result(scores)}"
  end
end

def match_result(scores)
  "Player wins = #{scores[:player]}, Computer wins = #{scores[:computer]}"
end

def update_scores(player, computer, scores)
  if win?(player, computer)
    scores[:player] += 1
  elsif win?(computer, player)
    scores[:computer] += 1
  end
  scores
end

system('clear') || system('cls')

scores = {
  player: 0,
  computer: 0
}

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("(You can just enter the first letter (capital for Spock)")
    choice = Kernel.gets.chomp

    choice = expand_shorthand(choice) if choice.length == 1

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}! Computer chose #{computer_choice}!")

  display_game_result(choice, computer_choice)

  scores = update_scores(choice, computer_choice, scores)
  prompt("Current standings: #{match_result(scores)}")

  break if scores[:player] == 5 || scores[:computer] == 5

  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp

  break unless answer.downcase.start_with?('y')
end

display_final_result(scores)
prompt("Thanks for playing!")
