require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require "./game_bacon_bits"
#require './pig_player'




# play = Player.new
# play.start_up

# p = Pig.new(play.maxscore, play.players.length)


# while p.winner == false
#   (0...play.players.length).map{|x|
#   puts "\n#{play.players[x]}, it is your turn. You currently have #{p.scores[x]} points.\n"
#   loop do
#     puts "You rolled a #{p.turn(p.die_roll)}. Your score for the turn is now #{p.temp_score}."
#     if p.temp_score != 0
#       puts "Would you like to roll again?"
#       if gets.chomp == "n"
#         p.bank(x)
#         puts "\nYour score is now #{p.scores[x]}.\n\n"
#         sleep(1)
#         puts "\n-----------------------------------------------\n"
#         break
#       end
#     else
#       puts "\n-----------------------------------------------\n"
#       break
#     end
#   end
#   }
# end

# puts "\n\nFinal Scoreboard:\n"
# (0...players.length).map {|x| puts "#{players[x]}: #{@scores[x]}"}

class PigGameTests < MiniTest::Test
  def test_pig_knows_max_score
    p = Pig.new
    assert_equal p.maxscore, 10
  end

  def test_pig_can_roll_dice
    p = Pig.new 
    assert (1..6).include?(p.die_roll)
  end

  def test_non_ones_give_points
    p = Pig.new
    assert p.turn(2) > 0
  end

  def test_ones_give_zero_points
    p = Pig.new
    p.turn(1)
    assert_equal 0, p.temp_score
  end

  def test_players_can_bank_scores
    p = Pig.new
    p.turn(5)
    p.bank
    assert_equal p.scores.first, 5
  end

  def test_players_can_win
    p=Pig.new
    p.turn(105)
    p.bank
    assert p.winner
  end
end