require 'pry'

class Game
  attr_reader :maxscore

  def initialize maxscore=nil
    @maxscore = maxscore || 100
  end

  def die_roll
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
    roll = die_roll
    unless roll == 1
      @temp_score += roll
      puts "You rolled a #{roll}. 
Your score for the turn is #{@temp_score}"
    else
      @temp_score = 0
      puts "Sorry! You rolled a 1 and lost your points!"
    end
    @temp_score
  end

  def bank
  end
end
