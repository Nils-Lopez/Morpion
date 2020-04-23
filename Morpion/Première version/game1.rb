class Game
	attr_accessor :player1, :player2
	@@abc = [0, "   ","   ","   ","   ","   ","   ","   ","   ","   ",]

	def initialize(name1, name2)
		@player1 = Player.new(name1.red, "x")
		@player2 = Player.new(name2.blue, "o")
	end

	def ask_p1
		puts "#{@player1.name} entrez votre case(ex: 'A3' = en haut à droite)"
		ind = 0
		action1 = "z"
		possibilities = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
		while !possibilities.include?(action1)
			if !possibilities.include?(action1) && ind == 1
				puts "Commande non reconnue, rentrez uniquement une case !"
			end
			print ">"
			action1 = gets.chomp.capitalize
			ind = 1
			if already_used(action1)
				puts "Attention : case déjà utilisée".red
				ind = 0
				action1 = "z"
			end
		end
		check_action(action1, @player1)
		check_win
		check_nul
		ask_p2
	end

	def ask_p2
		puts "#{@player2.name} entrez votre case(ex: 'A3' = en haut à droite)"
		ind = 0
		action1 = "z"
		possibilities = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
		while !possibilities.include?(action1)
			if !possibilities.include?(action1) && ind == 1
				puts "Commande non reconnue, rentrez uniquement une case !"
			end
			print ">"
			action1 = gets.chomp.capitalize
			ind = 1
			if already_used(action1)
				puts "Attention : case déjà utilisée".red
				ind = 0
				action1 = "z"
			end
		end
		check_action(action1, @player2)
		check_win
		check_nul
		ask_p1
	end

	def check_nul 
		unless @@abc.include?("   ")
			end_nul
		end
	end

	def already_used(action)
		if action[0] == 'A'
			used_A(action)	
		elsif action[0] == 'B'
			used_B(action)
		elsif action[0] == 'C'
			used_C(action) 
		end
	end

	def used_A(action)
		i = 0
		3.times do
			if action[1] == '1'
				if @@abc[1 + (i*3)] != "   "
					return true
				else
					return false
				end
			elsif action[1] == '2'
				if @@abc[2  + (i*3)] != "   "
					return true
				else
					return false
				end
			else
				if @@abc[3  + (i*3)] != "   "
					return true
				else
					return false
				end
			end
			i += 1
		end
	end

	def used_B(action)
		if action[1] == '1'
			if @@abc[4] != "   "
				return true
			else
				return false
			end
		elsif action[1] == '2'
			if @@abc[5] != "   "
				return true
			else
				return false
			end
		else
			if @@abc[6] != "   "
				return true
			else
				return false
			end
		end
	end

	def used_C(action)
		if action[1] == '1'
			if @@abc[7] != "   "
				return true
			else
				return false
			end
		elsif action[1] == '2'
			if @@abc[8] != "   "
				return true
			else
				return false
			end
		else
			if @@abc[9] != "   "
				return true
			else
				return false
			end
		end
	end

	def check_action(action, player)
		if action[0] == 'A'
			check_A(action, player)
		elsif action[0] == 'B'
			check_B(action, player)
		else
			check_C(action, player)
		end
	end

	def check_A(action, player)
		if action[1] == '1'
			@@abc[1] = player.symbol
		elsif action[1] == '2'
			@@abc[2] = player.symbol
		else
			@@abc[3] = player.symbol
		end
		board_A
		board_B
		board_C
	end

	def check_B(action, player)
		if action[1] == '1'
			@@abc[4] = player.symbol
		elsif action[1] == '2'
			@@abc[5] = player.symbol
		else
			@@abc[6] = player.symbol
		end
		board_A
		board_B
		board_C
	end

	def check_C(action, player)
		if action[1] == '1'
			@@abc[7] = player.symbol
		elsif action[1] == '2'
			@@abc[8] = player.symbol
		else
			@@abc[9] = player.symbol
		end
		board_A
		board_B
		board_C
	end

	def board_A
		puts "	   1    2    3"
		puts "	  -------------"
		puts "	A |#{@@abc[1]}|#{@@abc[2]}|#{@@abc[3]}|"
	end

	def board_B
		puts "	  -------------"
		puts "	B |#{@@abc[4]}|#{@@abc[5]}|#{@@abc[6]}|"
	end

	def board_C
		puts "	  -------------"
		puts "	C |#{@@abc[7]}|#{@@abc[8]}|#{@@abc[9]}|"
		puts "	  -------------"	
	end

	def check_win
		check_win_A
		check_win_B
		check_win_C
		check_win_1
		check_win_2
		check_win_3
		check_win_diag1
		check_win_diag2
	end

	def check_win_A
		if @@abc[1] == @player1.symbol && @@abc[2] == @player1.symbol && @@abc[3] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[1] == @player2.symbol && @@abc[2] == @player2.symbol && @@abc[3] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_B
		if @@abc[4] == @player1.symbol && @@abc[5] == @player1.symbol && @@abc[6] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[4] == @player2.symbol && @@abc[5] == @player2.symbol && @@abc[6] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_C
		if @@abc[7] == @player1.symbol && @@abc[8] == @player1.symbol && @@abc[9] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[7] == @player2.symbol && @@abc[8] == @player2.symbol && @@abc[9] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_1
		if @@abc[1] == @player1.symbol && @@abc[4] == @player1.symbol && @@abc[7] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[1] == @player2.symbol && @@abc[4] == @player2.symbol && @@abc[7] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_2
		if @@abc[2] == @player1.symbol && @@abc[5] == @player1.symbol && @@abc[8] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[2] == @player2.symbol && @@abc[5] == @player2.symbol && @@abc[8] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_3
		if @@abc[3] == @player1.symbol && @@abc[6] == @player1.symbol && @@abc[9] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[3] == @player2.symbol && @@abc[6] == @player2.symbol && @@abc[9] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_diag1
		if @@abc[1] == @player1.symbol && @@abc[5] == @player1.symbol && @@abc[9] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[1] == @player2.symbol && @@abc[5] == @player2.symbol && @@abc[9] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def check_win_diag2
		if @@abc[3] == @player1.symbol && @@abc[5] == @player1.symbol && @@abc[7] == @player1.symbol
			game_win(@player1.name)
		elsif @@abc[3] == @player2.symbol && @@abc[5] == @player2.symbol && @@abc[7] == @player2.symbol
			game_win(@player2.name)
		else
			return false
		end
	end

	def game_win(player)
		puts "===================================="
		puts "Le jeu est fini #{player} a gagné !!"
		puts "===================================="
		exit
	end

	def end_nul
		puts "===================================="
		puts "    Le jeu est fini, match nul !    "
		puts "   Vous êtes tous les deux nuls...  "
		puts "===================================="
		exit
	end

end

