require 'pry'

class Game
  attr_reader :maxscore

  def initialize maxscore
    @maxscore = maxscore
  end
end

class Pig < Game
  
  def initialize maxscore
    super (maxscore)
  end

end
