require_relative 'Game'
class Action < Game
	attr_accessor :choice

	def initialize
		# @choice = action
		putspla
	end
	def putspla
		binding.pry
	end
end