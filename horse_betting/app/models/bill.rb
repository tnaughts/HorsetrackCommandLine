class Bill < ActiveRecord::Base
	belongs_to :money
	validates_presence_of :money_id, :inventory, :denomination
	validates_uniqueness_of :denomination

	def display
		"$#{self.denomination}, #{self.inventory}"
	end
end
