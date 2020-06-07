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

system('clear') || system('cls')
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

  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing!")
