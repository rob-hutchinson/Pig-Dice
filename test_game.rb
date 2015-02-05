require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require "./game_bacon_bits"



# p = Pig.new

# players = Array.new(2, "")

# until p.winner
#   (0...players.length).map{|x|
#   loop do
#     puts "You rolled a #{p.turn(p.roll)}. Your score for the turn is now #{p.temp_score}."
#     if p.temp_score != 0
#       puts "Would you like to roll again?"
#       if gets.chomp == "n"
#         p.bank(x)
#         puts "\nYour score is now #{p.scores[x]}.\n"
#         sleep(1)
#         "-------------------------------------------"
#         break
#       end
#     else
#       break
#     end
#   end
#   }
# end


# while winner == false  
# (0...players.length).map{|x| loop do
#   p.turn(players.index[x])
#   puts "You rolled a #{roll}. Your score
# for the turn is #{@turn_score}. Would you like
# to roll again?"
#   if gets.chomp == "n"
#     p.bank(players.index[x])
#   else

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