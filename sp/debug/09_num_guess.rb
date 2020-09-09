def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

    end
  end
end

def play_again?
  puts 'Play again? (y/n)'
  input = gets.chomp.downcase
  input == 'y'
end

loop do
  guess_number(10, 3)
  break unless play_again?
end

=begin
Problem 1: If you guess the wrong number, the program immediately recurses,
choosing a new number and increasing stack depth. This 1) fails to take
advantage of being inside a loop structure, which itself should take care of
the next guess; 2) places a call to restart the game in the wrong place (inside
the loop).

Problem 2: There is no break unless you've guessed three times, regardless of
whether you have won. The only way to exit is to make three guesses.

This can be resolved by putting a break on the win condition, and instead of
recursively calling guess_number to play again, simply looping in the main
program, alongside a play-again prompt.
=end
