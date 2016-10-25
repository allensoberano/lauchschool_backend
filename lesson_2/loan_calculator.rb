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

def spaces_only(string)
  if / / =~ string
    prompt(messages('no_spaces', LANGUAGE))
    true
  end
end

def empty_value(string)
  if string.empty?()
    prompt(messages('empty', LANGUAGE))
    true
  end
end

def not_integer?(num)
  num.to_i.to_s != num
end

def not_float?(num)
  num = "0" + num if num.start_with?(".")
  num.to_f.to_s != num
end

def name_valid?(name)
  return false if empty_value(name)
  return false if spaces_only(name)

  true
end

def user_name
  prompt(messages('user_name', LANGUAGE))
  loop do
    name = Kernel.gets().chomp()
    return name.capitalize if name_valid?(name)
  end
end

def loan_empty?(loan_amount)
  if loan_amount.empty?() || loan_amount.to_i.zero?()
    prompt(messages('loan_amount_empty', LANGUAGE))
    true
  end
end

def loan_error?(loan_amount)
  if not_integer?(loan_amount)
    prompt(messages('loan_amount_error', LANGUAGE))
    true
  end
end

def loan_invalid?(loan_amount)
  loan_empty?(loan_amount) || loan_error?(loan_amount)
end

def loan_amount
  prompt(messages('loan_amount', LANGUAGE))
  loop do
    loan_amount = Kernel.gets().chomp()
    return loan_amount.to_f unless loan_invalid?(loan_amount)
  end
end

def interest_empty?(interest_rate)
  if interest_rate.empty?() || spaces_only(interest_rate)
    prompt(messages('interest_empty', LANGUAGE))
    true
  end
end

def interest_error?(interest_rate)
  if not_float?(interest_rate) && not_integer?(interest_rate)
    prompt(messages('interest_error', LANGUAGE))
    prompt(messages('interest_rate', LANGUAGE))
    true
  end
end

def interest_invalid?(interest_rate)
  interest_empty?(interest_rate) && interest_error?(interest_rate)
end

def interest_rate
  prompt(messages('interest_rate', LANGUAGE))
  loop do
    interest_rate = Kernel.gets().chomp()
    return interest_rate.to_f unless interest_invalid?(interest_rate)
  end
end

def monthly_int_rate(num)
  num.to_f / 12 / 100
end

def duration_invalid?(duration)
  if duration.empty?()
    prompt(messages('duration_empty', LANGUAGE))
    true
  elsif not_integer?(duration)
    prompt(messages('duration_error', LANGUAGE))
    true
  else
    false
  end
end

def loan_duration
  prompt(messages('loan_duration', LANGUAGE))
  loop do
    loan_duration = Kernel.gets().chomp()
    return loan_duration.to_i * 12 unless duration_invalid?(loan_duration)
  end
end

def monthly_payment(loan, apr, duration)
  if apr.zero?
    monthly_payment = loan / duration
  else
    monthly_payment = loan * monthly_int_rate(apr)
    monthly_payment /= (1 - (1 + monthly_int_rate(apr))**-duration)
  end
  format("$%.2f", monthly_payment.to_f)
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

prompt(messages('welcome', LANGUAGE))

name = user_name()

hello_greeting = messages('hello_name', LANGUAGE)
prompt(format(hello_greeting, name: name))

loan_amount = loan_amount()
prompt(messages('thank_you', LANGUAGE))

interest_rate = interest_rate()
prompt(messages('interest_zero', LANGUAGE)) if interest_rate.to_f.zero?
prompt(messages('thank_you', LANGUAGE))

loan_duration = loan_duration()
prompt(messages('thank_you', LANGUAGE))

monthly_payment = monthly_payment(loan_amount, interest_rate, loan_duration)
monthly_payment_display = messages('calculate', LANGUAGE)
prompt(format(monthly_payment_display, monthly_payment: monthly_payment))
