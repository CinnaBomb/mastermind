class ComputerGame
	def initialize
		@colors = ["red", "blue", "yellow", "green", "purple", "orange"]
		@guess_count = 0
		@max_guess_count = 12
		@guess = [false, false, false, false]
	end

	def new_code
		loop do 
			@code = gets.downcase.chomp.split(" ")
			break if valid_code
		end
		#puts @code.inspect
	end

	def valid_code
		return true if @code.length == 4 && @code.all?{|color| @colors.include?(color)}
		puts "Be sure to spell color names correctly and choose a color for each spot!"
		false
	end

	def computer_guess
		puts "Computer has #{@max_guess_count-@guess_count} guesses left"
		puts "______________________________________"
		@guess.map! do |each| 
			if each ==false
				each = @colors.sample
			else
				each = each
			end
		end
		puts "The computer guesses " + @guess.join(" ")
		check_guess
		@guess_count +=1
	end

	def check_guess
		if @guess == @code
			puts "Wow the computer is smart!"
		else
			code_hints
		end
	end

	def code_hints
		temp_code = [].replace(@code)
		temp_guess = [].replace(@guess)
		correct_color_and_position = 0
		correct_color_wrong_position = 0
		#CHECK FOR CORRECT COLORS IN CORRECT POSITIONS
		for i in 0...temp_guess.length
			if temp_guess[i] == temp_code[i]
				correct_color_and_position +=1
				temp_code[i] = "code"
				temp_guess[i] = "guess"
			end
		end
		#CHECK FOR CORRECT COLORS IN WRONG POSITIONS
		for i in 0...temp_guess.length
			if temp_code.include?(temp_guess[i])
				correct_color_wrong_position +=1
			end
		end
		#CHANGE WRONG GUESSES IN @GUESS TO FALSE
		for i in 0...temp_guess.length
			if @guess[i] != @code[i]
				@guess[i] = false
			end
		end
		#puts @guess.inspect
		puts "The computer has #{correct_color_and_position} colors in their correct positions."
		puts "The computer has #{correct_color_wrong_position} correct colors in the wrong positions."

	end

	def game_over?
		if @guess == @code
			puts "____________________________"
			puts "|The computer won! YOU LOSE!|"
			true
		elsif @guess_count >= @max_guess_count
			puts "____________________________"
			puts "|The computer lost! YOU WON!|"
			true
		else
			false
		end
	end

	def play
		how_to_play
		new_code
		until game_over?
			computer_guess
		end
		puts "|Game Over!                |"
		puts "____________________________"
	end

	def how_to_play
		puts "_________________________________________________________________________"
		puts "| Let's play Mastermind! Make up a secret code of 4 colors               |"
		puts "| The computer will try to guess the colors in the correct positions!    |"
		puts "| To create a code, type the color in order of position.                 |"
		puts "| Example: if you want your code to be Green, Blue, Yellow, and Red, type|"
		puts "| 'Green Blue Yellow Red' in that order with only spaces to separate.    |"
		puts "| There are 6 colors to choose from and each can be used multiple times. |"
		puts "| Type 'q' to quit. Let's get started!                                   |"
		puts "_________________________________________________________________________"

	end
end