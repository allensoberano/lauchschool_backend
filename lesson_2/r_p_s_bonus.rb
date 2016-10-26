require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('rps.yml')

VALID_CHOICES = %w(1 2 3 4 5)
WORD_CHOICES = %w(rock paper scissors lizard spock)

WINNING_WAYS = { 'rock' => %w(scissors lizard),
                 'paper' => %w(rock spock),
                 'scissors' => %w(paper lizard),
                 'lizard' => %w(spock paper),
                 'spock' => %w(rock scissors) }

def clear_screen
  system('clear') || system('cls')
end

def message(message)
  MESSAGES[message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def play_again?
  prompt(message('play_again'))

  loop do
    choice = Kernel.gets().chomp()
    if %w(y n).include?(choice.downcase)
      return choice
    else
      prompt(message('invalid_choice'))
    end
  end
end

def convert_choice(choice)
  WORD_CHOICES[choice.to_i - 1]
end

def empty_value(string)
  string.empty?() || / / =~ string
end

def valid_choice?(choice)
  VALID_CHOICES.include?(choice)
end

def win?(first_choice, second_choice)
  WINNING_WAYS[first_choice].include?(second_choice)
end

def choose_weapon
  loop do
    choice = Kernel.gets().chomp()
    if valid_choice?(choice)
      return convert_choice(choice)
    else
      prompt(message('invalid_choice'))
    end
  end
end

def display_round_winner(player, computer)
  if player == computer
    prompt('Tie')
  elsif win?(player, computer)
    prompt('You won')
  else
    prompt('Computer won')
  end
end

# Start of program
clear_screen

loop do
  player_choice = ''
  player_score = 0
  computer_score = 0

  prompt(message('welcome'))

  loop do
    prompt(message('select'))
    player_choice = choose_weapon()
    computer_choice = convert_choice(VALID_CHOICES.sample)

    clear_screen

    weapon_chosen = message('chosen')
    prompt(format(weapon_chosen,
                  player_choice: player_choice,
                  computer_choice: computer_choice))

    display_round_winner(player_choice, computer_choice)

    player_score += 1 if win?(player_choice, computer_choice)
    computer_score += 1 if win?(computer_choice, player_choice)

    score_message = message('score')
    prompt(format(score_message,
                  player_score: player_score,
                  computer_score: computer_score))

    break if player_score == 5 || computer_score == 5
  end

  prompt(message('game_over'))
  break unless play_again?() == 'y'
end
