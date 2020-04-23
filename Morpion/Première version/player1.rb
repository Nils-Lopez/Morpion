class Player
	attr_accessor :name, :symbol

	def initialize(username, sym)
		@name = username

		if sym == "x"
			@symbol = " X ".red
		else 
			@symbol = " O ".blue
		end

	end

end