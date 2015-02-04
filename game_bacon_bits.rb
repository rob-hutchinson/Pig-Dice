require 'pry'

class Game
  attr_reader :maxscore

  def initialize maxscore=nil
    @maxscore = maxscore || 100
  end

  def roll
    rand(1..6)
  end
end

class Pig < Game
  attr_reader :temp_score

  def initialize maxscore=nil
    super (maxscore)
    @temp_score = 0
  end

  def one_roll
    unless roll == 1
      @temp_score += roll
    else
      @temp_score = 0
    end
    
    @temp_score
  end

  def bank
  end
end
