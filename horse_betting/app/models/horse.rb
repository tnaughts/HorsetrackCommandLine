class Horse < ActiveRecord::Base
	validates_presence_of :odds, :number, :name
	validates_uniqueness_of :name, :number

	def did_win
		false
	end

	def display
		"#{self.number}, #{self.name}, #{self.odds}, #{self.did_win} \n"
	end

end
