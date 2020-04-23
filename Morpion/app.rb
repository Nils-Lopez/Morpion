require 'colorize'
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/action'
require_relative 'lib/board'

def intro
	puts " _______________________________________"
	puts "|      Bienvenue dans le morpion !      |"
	puts "|Il faut aligner 3 'X' ou 'O' en premier|"
	puts "|Appuyez sur ENTER pour lancer la partie|"
	puts "|_______________________________________|"
	gets.chomp
	player1 = ask_name(1)
	player2 = ask_name(2)
	game = Game.new(player1, player2)
	return game
end

def ask_name(ind)
	if ind == 1
		joueur = "Joueur 1".red
	else
		joueur = "Joueur 2".blue
	end
	puts "#{joueur} : Choisissez votre pseudo"
	print ">"
	player = gets.chomp
end

game = intro
game.perform