# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().nonzero?()
end

def integer?(input)
  # uses .to_i so if float is entered, input is converted to integer
  # and will not match original input
  input.to_i.to_s == input
end

def float?(input)
  input.to_f == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operator_to_message(op)
  # if we assign the return value of the case
  # into a variable 'operator' then we can return it
  # at the end.
  operator = case op
  when '1'
    'Adding'
  when '2'
    'Subracting'
  when '3'
    'Multplying'
  when '4'
    'Dividing'
  end

  x = "Some code here"

  operator
end

prompt(MESSAGES['welcome'])

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES{'invalid_number'})
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  # heredoc allows for multiine strings
  operator_prompt = <<-MSG
  What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operator_to_message(operator)} the two numbers...")

  result =
    case operator
    when '1'
      number1.to_i + number2.to_i()
    when '2'
      number1.to_i - number2.to_i()
    when '3'
      number1.to_i * number2.to_i()
    when '4'
      number1.to_f / number2.to_f()
  end

  prompt("The result is #{result}")

  prompt(MESSAGES['perform_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
