require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require "./game_bacon_bits"
require './pig_player'

class PigGameTests < MiniTest::Test
  def test_game_knows_max_score
    p = Pig.new
    h = Hog.new
    assert_equal p.maxscore, 100
    assert_equal h.maxscore, 100
  end

  def test_game_can_roll_dice
    p = Pig.new 
    h = Hog.new
    assert (1..6).include?(p.die_roll)
    assert (1..6).include?(h.die_roll)
  end

  def test_non_ones_give_points
    p = Pig.new
    assert p.turn > 0
  end

  def test_ones_give_zero_points
    p = Pig.new
    x = 0
    until x == 1
      x = p.turn
    end
    assert_equal 0, p.temp_score
  end

  def test_players_can_bank_scores
    p = Pig.new
    x = 0
    while x < 2 
      x = p.turn
    end
    p.bank
    assert p.scores.first > 0
  end

  def test_players_can_win
    p=Pig.new
    p.scores << 105
    assert p.winner
  end
end

class HogGameTests < MiniTest::Test

  def test_hog_can_roll_many_dice
    h = Hog.new
    h.dice_num(5)
    assert_equal h.turn.length, 5
  end

  def test_any_ones_means_zero_points_in_hog
    h = Hog.new 
    h.dice_num(1000)
    assert_equal h.check(h.turn), 0
  end

  def test_hog_can_score_points
    h = Hog.new
    h.dice_num(1)
    x = []
    1000.times do x << h.turn.inject(:+) end
      assert x.inject(:+)/1000 > 0
    end

    def test_hog_can_bank_points
      h = Hog.new
      h.dice_num(1)
      x = 0
      until x > 0
        x = h.check(h.turn)
      end
      assert h.scores[0]>0
    end
    
  end
