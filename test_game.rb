require 'simplecov'
require 'pry'
require 'minitest/autorun'
require "./game_bacon_bits"

SimpleCov.start

class PigGameTests < MiniTest::Test
  def test_pig_knows_max_score
    p = Pig.new 100
    assert_equal p.maxscore, 100
  end

  def test_pig_can_roll_dice
    p = Pig.new 
    assert (1..6).include?(p.roll)
  end

  def test_turn_score_can_return_0
    p = Pig.new
   
    assert p.one_roll > 1 ||  0
  end

end