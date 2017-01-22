require './player_game.rb'
require './computer_game.rb'
class Game
	def play_again?
		choice = false
		loop do
			puts "Would you like to play Mastermind again? Type y or n."
			choice = gets.chomp
			break if choice =="y" || choice == "n"
		end
		if choice == "y"
			true
		else
			false
		end
	end

	def play
		loop do
			choice = false
			loop do 
				puts "Let's play Mastermind!"
				puts "Do you want to guess the code or create the code?"
				puts "Type 'guess' or 'create' or 'q' to quit"
				choice = gets.chomp
				break if choice == "guess" || choice == "create" || choice == "q"
			end

			if choice == "guess"
				game = PlayerGame.new.play
			elsif choice == "create"
				game = ComputerGame.new.play
			else
				exit
			end
			break if play_again? == false
		end
	end
end

game = Game.new.play