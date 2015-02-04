require 'simplecov'
require 'pry'
require 'minitest/autorun'
require "./game_bacon_bits"

SimpleCov.start

class PigGameTests < MiniTest::Test
  def test_games_know_max_score
    g = Game.new 100
    p = Pig.new 100
    
    assert_equal g.maxscore, 100
    assert_equal p.maxscore, 100
  end
end