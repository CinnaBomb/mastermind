require './player_game.rb'
require './computer_game.rb'

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