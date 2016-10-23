require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('loan_calculator.yml')
LANGUAGE = 'en'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_user_name()
  prompt(messages('user_name', LANGUAGE))
  loop do
    name = Kernel.gets().chomp()
    if name.empty?()
      prompt(messages('empty_name', LANGUAGE))
    elsif name.match(' ')
      prompt(messages('no_spaces', LANGUAGE))
    else
      return name.capitalize!
    end
  end
end

def get_loan_amount()
  prompt(messages('loan_amount', LANGUAGE))

  loop do
    loan_amount = Kernel.gets().chomp()
    if loan_amount.empty?() || loan_amount.to_i == 0
      prompt(messages('loan_amount_empty', LANGUAGE))
    elsif not_integer?(loan_amount)
      prompt(messages('loan_amount_error', LANGUAGE))
    else
      return loan_amount.to_i
    end
  end
end

def not_integer?(num)
  num.to_i.to_s != num
end

def not_float?(num)
  num.to_f.to_s !=num
end

def get_interest_rate()
  prompt(messages('interest_rate', LANGUAGE))

  loop do
    interest_rate = Kernel.gets().chomp()
    if interest_rate.empty?()
      prompt(messages('interest_empty', LANGUAGE))
    elsif not_float?(interest_rate) && not_integer?(interest_rate)
      prompt(messages('interest_error', LANGUAGE))
      prompt(messages('interest_rate', LANGUAGE))
    else
      return interest_rate.to_f
    end
  end
end

def get_loan_duration()
  prompt(messages('loan_duration', LANGUAGE))
end

prompt(messages('welcome', LANGUAGE))

name = get_user_name()

hello_greeting = messages('hello_name', LANGUAGE)
prompt(format(hello_greeting, name: name))

loan_amount = get_loan_amount()
prompt(messages('thank_you', LANGUAGE))

interest_rate = get_interest_rate()

interest_rate == 0 ? prompt(messages('interest_zero', LANGUAGE)) : prompt(messages('thank_you', LANGUAGE))

loan_duration = get_loan_duration()

# get loan duration in years
#   - check for empty or space
#   - ask for apr amount 
#   - (bonus: ask if they know if the apr is by year or by month)


# calculate monthly interest rate
# calculate loan duration in months
# calculate monthly payment
# Calculate principle vs interest

# display Monthly payment broken down into principle and interest
# and overview of princple and interest over the life of the loan.


# m = p * (j / (1 - (1 + j)**-n))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
