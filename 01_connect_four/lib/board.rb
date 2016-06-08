class Board
	attr_reader :board, :p1, :p2
	def initialize
		@board = Array.new(6) { Array.new(7,"x") } #7 column, 6 row 
		@p1 = "\u26AA".encode("utf-8")
		@p2 = "\u26AB".encode("utf-8")
	end

	def makeMove(p, column)
		if column < 8 && column >= 1
			inserted = false
			board.each_with_index do |item, index|
					if item[column-1] == "x" && !inserted
						board[index][column-1] = p
						inserted = true
					end
			end
			return inserted
		else
			return false
		end
	end

	def displayBoard
		puts ""
		puts "       1 2 3 4 5 6 7"
		board.reverse.each_with_index do |item, index|
			print "row #{index+1}: "
			item.each_with_index do |item2, index2|
				print "#{item2} "
			end
			puts ""
		end
	end

	def victory?
		victory = false
		board.reverse.each_with_index do |item, index|
			item.each_with_index do |item2, index2|
				if index < 3
					#puts "victory? row #{index} column #{index2}"
					if board[index][index2] == board[index+1][index2] && 
					board[index][index2] == board[index+2][index2] && 
					board[index][index2] == board[index+3][index2] && 
					board[index][index2] == p1
						victory = true
						puts "player1 #{p1} won the game!"
					elsif board[index][index2] == board[index+1][index2] && 
					board[index][index2] == board[index+2][index2] && 
					board[index][index2] == board[index+3][index2] && 
					board[index][index2] == p2
						victory = true
						puts "player2 #{p2} won the game!"
					end
				end
				if index2 < 4
					if board[index][index2] == board[index][index2+1] && 
					board[index][index2] == board[index][index2+2] && 
					board[index][index2] == board[index][index2+3] && 
					board[index][index2] == p1
						victory = true
						puts "player1 #{p1} won the game!"
					elsif board[index][index2] == board[index][index2+1] && 
					board[index][index2] == board[index][index2+2] && 
					board[index][index2] == board[index][index2+3] && 
					board[index][index2] == p2
						victory = true
						puts "player2 #{p2} won the game!"
					end
				end
				if index < 3 && index2 < 4
					if board[index][index2] == board[index+1][index2+1] && 
					board[index][index2] == board[index+2][index2+2] && 
					board[index][index2] == board[index+3][index2+3] && 
					board[index][index2] == p1
						victory = true
						puts "player1 #{p1} won the game!"
					elsif board[index][index2] == board[index+1][index2+1] && 
					board[index][index2] == board[index+2][index2+2] && 
					board[index][index2] == board[index+3][index2+3] && 
					board[index][index2] == p2
						victory = true
						puts "player2 #{p2} won the game!"
					end
				end
				if index < 3 && index2 > 2
					if board[index][index2] == board[index+1][index2-1] && 
					board[index][index2] == board[index+2][index2-2] && 
					board[index][index2] == board[index+3][index2-3] && 
					board[index][index2] == p1
						victory = true
						puts "player1 #{p1} won the game!"
					elsif board[index][index2] == board[index+1][index2-1] && 
					board[index][index2] == board[index+2][index2-2] && 
					board[index][index2] == board[index+3][index2-3] && 
					board[index][index2] == p2
						victory = true
						puts "player2 #{p2} won the game!"
					end
				end
			end
		end
		if !board.join.include?("x")
			puts "Game finished, it's a draw!"
			victory = true
		end
		return victory
	end

	def gameLoop
		gameOn = true
		while gameOn #do
			loop do
				puts "player1 #{p1} make move (column 1 - 7)"
				input = gets.chomp
				result = makeMove(p1, input.to_i)
			break if result
			end
			displayBoard
			gameOn = !victory?
			loop do
				puts " player2 #{p2} make move (column 1 - 7)"
				input = gets.chomp
				result = makeMove(p2, input.to_i)
			break if result
			end
			displayBoard
			gameOn = !victory?
		end
	end
end

x = Board.new
x.gameLoop