require 'pry'
require './pig_player'
require './game_bacon_bits'

play = Player.new
play.start_up

puts "\nChoose mode"
puts "1) Pig"
puts "2) Hog"

choice = gets.chomp.to_i
if choice == 1
  game_class = Pig
else
  game_class = Hog
end

p = game_class.new(play.maxscore, play.players.length)


while p.winner == false
  if game_class == Pig
    (0...play.players.length).map{|x|
      puts "\n#{play.players[x]}, it is your turn. You currently have #{p.scores[x]} points.\n"
      loop do
        puts "You rolled #{p.turn}. Your score for the turn is now #{p.temp_score}."
        if p.temp_score != 0
          puts "Would you like to roll again?"
          if gets.chomp == "n"
            p.bank(x)
            puts "\nYour score is now #{p.scores[x]}.\n\n"
            sleep(1)
            puts "\n-----------------------------------------------\n"
            break
          end
        else
          puts "\n-----------------------------------------------\n"
          break
        end
      end
    }
  else
    (0...play.players.length).map{|x|
      puts "\n#{play.players[x]}, it is your turn. You currently have #{p.scores[x]} points.\n"
      loop do
        puts "How many dice would you like to roll?\n"
        p.dice_num(gets.chomp.to_i)
        p.turn
        puts "You rolled #{p.dice_holder} and your score for the turn was #{p.check(p.dice_holder,x)}."
        puts "\nYour score is now #{p.scores[x]}.\n\n"
        sleep(1)
        puts "\n-----------------------------------------------\n"
        break
      end
    }
  end
end


puts "GAME OVER"
puts "\n\nFinal Scoreboard:\n"
(0...play.players.length).map {|x| puts "#{play.players[x]}: #{p.scores[x]}"}