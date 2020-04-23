class Board
	attr_accessor :gamewinned

	def initialize

		@gamewinned = false
		@@board_array = [0, "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]
	end

	#Plateau de jeu
	def show_board
		puts "	   1    2    3"
		puts "	  -------------"
		puts "	A |#{@@board_array[1]}|#{@@board_array[2]}|#{@@board_array[3]}|"
		puts "	  -------------"
		puts "	B |#{@@board_array[4]}|#{@@board_array[5]}|#{@@board_array[6]}|"
		puts "	  -------------"
		puts "	C |#{@@board_array[7]}|#{@@board_array[8]}|#{@@board_array[9]}|"
		puts "	  -------------"	
	end

	#Checker match nul
	def match_null
		i = 0
		@@board_array.each do |boardcase|
			if boardcase != "   "
				i += 1
			end
		end
		if i == 10
			@gamewinned = true
			return true
		else 
			return false
		end
	end

	#Vérifie toutes les possibilités de victoire
	def winned(symbol)

		if @@board_array[1] == symbol && @@board_array[2] == symbol && @@board_array[3] == symbol 
			@gamewinned = true
			return true
		end

		if @@board_array[4] == symbol && @@board_array[5] == symbol && @@board_array[6] == symbol 
			@gamewinned = true
			return true
		end

		if @@board_array[7] == symbol && @@board_array[8] == symbol && @@board_array[9] == symbol 
			@gamewinned = true
			return true
		end


		if @@board_array[1] == symbol && @@board_array[4] == symbol && @@board_array[7] == symbol 
			@gamewinned = true
			return true
		end

		if @@board_array[2] == symbol && @@board_array[5] == symbol && @@board_array[8] == symbol 
			@gamewinned = true
			return true
		end

		if @@board_array[3] == symbol && @@board_array[6] == symbol && @@board_array[9] == symbol 
			@gamewinned = true
			return true
		end


		if @@board_array[1] == symbol && @@board_array[5] == symbol && @@board_array[9] == symbol 
			@gamewinned = true
			return true
		end

		if @@board_array[3] == symbol && @@board_array[5] == symbol && @@board_array[7] == symbol 
			@gamewinned = true
			return true
		end

	end

	#Analyse l'action à réaliser et la réalise
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
			@@board_array[1] = player.sym
		elsif action[1] == '2'
			@@board_array[2] = player.sym
		else
			@@board_array[3] = player.sym
		end
	end

	def check_B(action, player)
		if action[1] == '1'
			@@board_array[4] = player.sym
		elsif action[1] == '2'
			@@board_array[5] = player.sym
		else
			@@board_array[6] = player.sym
		end
	end

	def check_C(action, player)
		if action[1] == '1'
			@@board_array[7] = player.sym
		elsif action[1] == '2'
			@@board_array[8] = player.sym
		else
			@@board_array[9] = player.sym
		end
	end

	#Vérifie si la case choisie est déjà prise ou non
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
				if @@board_array[1 + (i*3)] != "   "
					return true
				else
					return false
				end
			elsif action[1] == '2'
				if @@board_array[2  + (i*3)] != "   "
					return true
				else
					return false
				end
			else
				if @@board_array[3  + (i*3)] != "   "
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
			if @@board_array[4] != "   "
				return true
			else
				return false
			end
		elsif action[1] == '2'
			if @@board_array[5] != "   "
				return true
			else
				return false
			end
		else
			if @@board_array[6] != "   "
				return true
			else
				return false
			end
		end
	end

	def used_C(action)
		if action[1] == '1'
			if @@board_array[7] != "   "
				return true
			else
				return false
			end
		elsif action[1] == '2'
			if @@board_array[8] != "   "
				return true
			else
				return false
			end
		else
			if @@board_array[9] != "   "
				return true
			else
				return false
			end
		end
	end
end