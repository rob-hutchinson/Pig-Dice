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
  
  def initialize maxscore=nil
    super (maxscore)
  end

end
