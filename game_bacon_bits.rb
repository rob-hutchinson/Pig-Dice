require 'pry'

class Game
  attr_reader :maxscore, :scores

  def initialize maxscore=nil, players=2
    @maxscore = maxscore || 10
    @scores = Array.new(players, 0)
    @winner = false
  end

  def die_roll
    rand(1..6)
  end

  def winner
      (0...@scores.length).map{|x| 
      if @scores[x]>=@maxscore
        @winner = true 
      end }
    @winner
  end
end

class Pig < Game
  attr_reader :temp_score, :roll

  def initialize maxscore=nil, players=2
    super
    @temp_score = 0
  end

  def turn roll
      unless roll == 1
        @temp_score += roll
        roll
      else
        @temp_score = 0
        1
      end
  end

  def bank player_num=0
      @scores[player_num] += @temp_score
      @temp_score = 0
  end
end

class Hog < Game
  def initialize maxscore=nil, players=2
    super
    @dice_holder = []
    @temp_score = 0
  end

  def turn roll
    roll.times do |x|
      @dice_holder << @die_roll
    end
    @dice_holder
  end
end
