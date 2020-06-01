def prompt message
  puts "=> #{message}"
end

def valid_number? num
  num.to_i != 0
end

def operation_to_lg op
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end


prompt "Welcome to the Calculator!"
prompt "Enter your name:"

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt "Make sure to enter your name."
  else
    break
  end
end

loop do # main loop
  num_1 = ''
  loop do
    prompt "What is your first number?"
    num_1 = gets.chomp

    if valid_number? num_1
      break
    else
      prompt "That doesn't look like a valid number."
    end
  end

  num_2 = ''
  loop do
    prompt "What is your second number?"
    num_2 = gets.chomp

    if valid_number? num_2
      break
    else
      prompt "That doesn't look like a valid number."
    end
  end

  prompt "I see, you chose #{num_1} and #{num_2}!"

  op_prompt = <<-MSG 
  What operation would you like to perform on these numbers?
        1) add 
        2) subtract 
        3) multiply 
        4) divide
  MSG
  prompt op_prompt
  
  operation = ""
  loop do
    operation = gets.chomp
    break if %w(1 2 3 4).include? operation
    prompt "You must choose 1, 2, 3, or 4."
  end

  result =  case operation
            when '1'
              num_1.to_i + num_2.to_i
            when '2'
              num_1.to_i - num_2.to_i
            when '3'
              num_1.to_i * num_2.to_i
            when '4'
              num_1.to_f / num_2.to_f
            end

  prompt "#{operation_to_lg operation} your numbers..."
  prompt "Your result is #{result}!"

  prompt "Do you want to perform another operation? (Y to calculate again)"
  again = gets.chomp
  break unless again.downcase.start_with? 'y'
end

prompt "Thanks for calculating, #{name}!"