# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'pry'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'ta'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operator_to_message(op)
  operator =
    case op
    when '1'
      'Adding'
    when '2'
      'Subracting'
    when '3'
      'Multplying'
    when '4'
      'Dividing'
    end

  operator
end

prompt(messages('welcome', LANGUAGE))

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

hello_greeting = messages('hello_name', LANGUAGE)
prompt(format(hello_greeting, name: name))

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('invalid_number', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('invalid_number', LANGUAGE))
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
      prompt(messages('must_choose', LANGUAGE))
    end
  end

  operator_to_message = operator_to_message(operator)
  operator_message = messages('operator_message', LANGUAGE)
  prompt(format(operator_message, operator_message: operator_to_message))

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

  result_message = messages('result_message', LANGUAGE)
  prompt(format(result_message, result: result))

  prompt(messages('perform_again', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))
