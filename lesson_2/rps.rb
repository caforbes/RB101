VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(msg)
  Kernel.puts(">> #{msg}")
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

system('clear') || system('cls')
loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}! Computer chose #{computer_choice}!")

  display_game_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing!")
