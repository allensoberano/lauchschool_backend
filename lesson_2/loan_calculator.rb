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

def user_name()
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
    if loan_amount.empty?() || loan_amount.to_i.zero?
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
  num.to_f.to_s != num
end

def get_interest_rate()
  prompt(messages('interest_rate', LANGUAGE))
  loop do
    interest_rate = Kernel.gets().chomp()
    interest_rate.to_f / 100
    if interest_rate.empty?()
      prompt(messages('interest_empty', LANGUAGE))
    elsif not_float?(interest_rate) && not_integer?(interest_rate)
      prompt(messages('interest_error', LANGUAGE))
      prompt(messages('interest_rate', LANGUAGE))
    else
      interest_rate
    end
  end
end

def monthly_interest_rate(num)
  (num / 12)
end

def get_loan_duration()
  prompt(messages('loan_duration', LANGUAGE))
  loop do
    loan_duration = Kernel.gets().chomp()
    if loan_duration.empty?()
      prompt(messages('duration_empty', LANGUAGE))
    elsif not_integer?(loan_duration)
      prompt(messages('duration_error', LANGUAGE))
    else
      return loan_duration.to_i
    end
  end
end

def get_monthly_payment(loan_amount, apr, duration)
  monthly_payment = loan_amount * (monthly_interest_rate(apr) / (1 - (1 + monthly_interest_rate(apr)) **- (duration * 12)))
  format("$%.2f", monthly_payment)
end


prompt(messages('welcome', LANGUAGE))

name = user_name()

hello_greeting = messages('hello_name', LANGUAGE)
prompt(format(hello_greeting, name: name))

loan_amount = get_loan_amount()
prompt(messages('thank_you', LANGUAGE))

interest_rate = get_interest_rate()
interest_rate.zero? ? prompt(messages('interest_zero', LANGUAGE)) : prompt(messages('thank_you', LANGUAGE))

loan_duration = get_loan_duration()
prompt(messages('thank_you', LANGUAGE))

monthly_payment = get_monthly_payment(loan_amount, interest_rate, loan_duration)
monthly_payment_display = messages('calculate', LANGUAGE)
prompt(format(monthly_payment_display, monthly_payment: monthly_payment))
