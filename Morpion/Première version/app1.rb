require 'colorize'
require 'pry'

require_relative 'lib/game1'
require_relative 'lib/player1'

def intro
	puts " _______________________________________"
	puts "|      Bienvenue dans le morpion !      |"
	puts "|Il faut aligner 3 'X' ou 'O' en premier|"
	puts "|Appuyez sur ENTER pour lancer la partie|"
	puts "|_______________________________________|"
	gets.chomp
end

def ask_name1
	joueur = "Joueur 1".red
	puts "#{joueur} : Choisissez votre pseudo"
	print ">"
	player1 = gets.chomp
end

def ask_name2
	joueur = "Joueur 2".blue
	puts "#{joueur} : Choisissez votre pseudo"
	print ">"
	player2 = gets.chomp
end

def create
	player1 = ask_name1
	player2 = ask_name2
	game = Game.new(player1, player2)
end

def restart
		puts "Voulez-vous rejouer?(O/N)"
		rep = "z"
		ind = 0
		while rep != "O" && rep != "N"
			if ind == 1 
				puts "Veuillez choisir uniquement entre 'O' et 'N'!"
			end
			rep = gets.chomp.capitalize
			ind = 1
		end
		if rep == "N"
			exit
		else
			game = create
			puts "Revanche !"
			game.board_A
			game.board_B
			game.board_C
			game.ask_p1
			restart
		end
end

def perform
	intro
	game = create
	puts "Début de la partie !"
	game.board_A
	game.board_B
	game.board_C
	game.ask_p1
end


perform


