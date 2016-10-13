class Horse < ActiveRecord::Base
	validates_presence_of :odds, :number, :name
	validates_uniqueness_of :name, :number

	def did_win
		if self.winner
			return "Won"
		else 
			return "Lost"
		end
	end

	def horse_won
		self.winner = true
		self.save
	end

	def horse_lost
		self.winner = false
		self.save
	end

	def display
		"#{self.number}, #{self.name}, #{self.odds}, #{self.did_win} \n"
	end

end
