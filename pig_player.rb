require 'pry'

class Player
  attr_reader :players, :maxscore

# :nocov:
  def initialize
  @players = []
  @maxscore = 100
  end

  def start_up
    puts "\n\nWelcome to Baconator! Please help me set up your game.\n"
    puts "How many players do you have?"
 
    gets.chomp.to_i.times do |x| 
      puts "\nPlease enter a player name:\n"
      @players << gets.chomp.downcase.capitalize 
    end

    puts "\nWhat score would you like to play to?\n"
      @maxscore = gets.chomp.to_i 
  end
# :nocov:
end