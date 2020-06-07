VALID_CHOICES = %w(rock paper scissors)

def prompt(msg)
  Kernel.puts(">> #{msg}")
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'scissors' && player2 == 'paper') ||
    (player1 == 'paper' && player2 == 'rock')
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
