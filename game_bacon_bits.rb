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
      # roll = die_roll
      unless roll == 1
        @temp_score += roll
        roll
#         puts "You rolled a #{roll}. 
# Your score for the turn is #{@temp_score}. Would
# you like to roll again?(y/n?)\n"
        # if gets.chomp == "n"
        #    @scores[player_num] += @temp_score
        #    @temp_score = 0
      else
        @temp_score = 0
        1
#       puts "Sorry! You rolled a 1 and lost your points!
# Your score is still #{@scores[player_num]}.\n"
      end
  end

  def bank player_num = 0
      @scores[player_num] += @temp_score
      #puts "Your score is now #{@scores[player_num]}."
      @temp_score = 0
  end

 
end
