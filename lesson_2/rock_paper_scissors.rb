require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_WAYS = {  'rock' => %w(scissors, lizard),
                  'paper' => %w(rock, spock),
                  'scissors' => %w(paper, lizard),
                  'lizard' => %w(spock, paper),
                  'spock' => %w(rock, scissors)
                }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINNING_WAYS[first].include?(second)

  # (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
  #   (first == 'paper' && (second == 'rock' || second == 'spock')) ||
  #   (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
  #   (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
  #   (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won.")
  else
    prompt("It's a tie!")
  end
end

def convert_abbr(choice)
  case choice
  when 'r'
    return 'rock'
  when 'p'
    return 'paper'
  when 's'
    return 'scissors'
  when 'l'
    return 'lizard'
  when 'sp'
    return 'spock'
  end
end

loop do
  player_score = 0
  computer_score = 0

  loop do
    player_choice = ''

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("You can use: r, p, s, l or sp")

      player_choice = Kernel.gets().chomp()

      player_choice = convert_abbr(player_choice) if player_choice.length <= 2

      if VALID_CHOICES.include?(player_choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{player_choice}, Computer chose: #{computer_choice}")

    puts win?(player_choice, computer_choice)
    binding.pry

    display_results(player_choice, computer_choice)

    player_score += 1 if win?(player_choice, computer_choice)
    computer_score += 1 if win?(computer_choice, player_choice)

    prompt("Player Score #{player_score}, Computer Score: #{computer_score}")

    if player_score == 5
      prompt("Congrats! You won")
      break
    elsif computer_score == 5
      prompt("Sorry, the computer won.")
      break
    end
  end
  prompt("Do you want to play again? Y or N")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing! Good Bye.")
