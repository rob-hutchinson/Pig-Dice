require 'pry'

class Player
  attr_reader :players

def initialize
  @players = []
end

def name name
  @players << name
end

end