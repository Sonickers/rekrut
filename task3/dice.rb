class Player
  attr_accessor :score

  def initialize
    @score = 0
  end
end

def roll_dice
  rand(1..6)
end

def game_round(round, first_player, second_player)
  puts "Round #{round}"
  sleep(0.5)
  game_turn(1, first_player)
  game_turn(2, second_player)
  puts "=" * 35
end

def game_turn(player_num, player)
  puts "Turn: Player #{player_num}"
  sleep(0.5)
  (1..10).each do |i|
    die1 = roll_dice
    die2 = roll_dice
    sum_dice = die1 + die2
    puts "Roll #{i}: #{die1} + #{die2} = #{sum_dice}"

    case sum_dice
    when 7, 11
        if i == 1
          break
        end
    when 2, 12
      if i == 1
        player.score +=120
        break
      end
    when 5
      break
    else
      player.score += (sum_dice / i)
    end
  end
  puts "\n"
end

def run_game
  first_player = Player.new
  second_player = Player.new

  (1..5).each do |round|
    game_round(round, first_player, second_player)
  end

  puts("Player 1 score: #{first_player.score}")
  puts("Player 2 score: #{second_player.score}")
  puts("=" * 35)
  if first_player.score > second_player.score
    puts("Player 2 won!")
  elsif first_player.score < second_player.score
    puts("Player 1 won!")
  else
    puts("It's a tie!")
  end
end

run_game
