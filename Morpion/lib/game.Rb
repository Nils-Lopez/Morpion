class Game
	attr_accessor :player1, :player2, :board

	def initialize(p1, p2)
		@player1 = Player.new(p1.red, " X ".red)
		@player2 = Player.new(p2.blue, " O ".blue)
		@players = [@player1, @player2]
		@board = Board.new
	end

	#Alterne le tour de chaque joueur puis montre le tableau
	def select_player
    while @board.gamewinned == false
      @players.each do |item| 
      	choose_a_case(item) 
      	@board.show_board
      end
    end
  end

  #Choix de case
  def choose_a_case(player)

  	puts "#{player.name} entrez votre case(ex: 'A3' = en haut à droite)"
		ind = 0
		@action = "z"
		possibilities = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
		while !possibilities.include?(@action)
			if !possibilities.include?(@action) && ind == 1
				puts "Commande non reconnue, rentrez uniquement une case !"
			end
			print ">"
			@action = gets.chomp.capitalize
			ind = 1
			if @board.already_used(@action)
				puts "Attention : case déjà utilisée".red
				ind = 0
				@action = "z"
			end
		end
		@board.check_action(@action, player)

		#Checker si la partie est gagnée
  	if @board.winned(player.sym)
  		@board.show_board
  		puts "===================================="
			puts "Le jeu est fini #{player.name} a gagné !!"
			puts "===================================="
			exit
		#Checker si la partie est fini en match nul
		elsif @board.match_null
			@board.show_board
			puts "===================================="
			puts "    Le jeu est fini, match nul !    "
			puts "   Vous êtes tous les deux nuls...  "
			puts "===================================="
			exit
		end
	end


	def perform
		@board.show_board
		select_player
	end
end