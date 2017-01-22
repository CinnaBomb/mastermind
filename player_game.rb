class PlayerGame
	def initialize
		@colors = ["red", "blue", "yellow", "green", "purple", "orange"]
		@guess_count = 0
		@max_guess_count = 12
	end

	def new_code
		@code = []
		4.times {@code << @colors.sample}
		#@code = ["orange", "red", "green", "red"]
		#puts @code.inspect
	end

	def player_guess
		puts "You have #{@max_guess_count-@guess_count} guesses left"
		puts "Colors to choose from are #{@colors.join(", ")}"
		puts "______________________________________"
		loop do 
			@guess = gets.downcase.chomp.split(" ")
			break if @guess == ['q'] || valid_guess
		end
		exit if @guess == ['q']
		check_guess
		@guess_count +=1
	end

	def computer_guess

	end

	def valid_guess
		return true if @guess.length == 4 && @guess.all?{|color| @colors.include?(color)}
		puts "Be sure to spell color names correctly and guess all 4 spaces"
		false
	end

	def check_guess
		if @guess == @code
			puts "Wow you are smart!"
		elsif @guess.any?{|color| @code.include?(color)}
			code_hints
		else
			puts "None of your guesses were the right colors"
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
		puts "You have #{correct_color_and_position} colors in their correct positions."
		puts "You have #{correct_color_wrong_position} correct colors in the wrong positions."

	end

	def game_over?
		if @guess == @code
			puts "_____________________"
			puts "|You won!            |"
			true
		elsif @guess_count >= @max_guess_count
			puts "_____________________"
			puts "|You lost!           |"
			true
		else
			false
		end
	end

	def play
		how_to_play
		new_code
		until game_over?
			player_guess
		end
		puts "|Game Over!          |"
		puts "_____________________"
	end

	def how_to_play
		puts "_________________________________________________________________________"
		puts "| Let's play Mastermind! There is a secret code made of 4 colors.        |"
		puts "| Guess the correct colors in their correct positions and win the game!  |"
		puts "| To guess, type the color in order of position.                         |"
		puts "| Example: if you want to guess Green, Blue, Yellow, and Red, type       |"
		puts "| 'Green Blue Yellow Red' in that order with only spaces to separate.    |"
		puts "| There are 6 colors to choose from and each can be used multiple times. |"
		puts "| Type 'q' to quit. Let's get started!                                   |"
		puts "_________________________________________________________________________"

	end
end

