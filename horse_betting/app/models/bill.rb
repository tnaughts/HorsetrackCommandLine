class Bill < ActiveRecord::Base
	belongs_to :money
	validates_presence_of :money_id, :inventory, :denomination
	validates_uniqueness_of :denomination
	validates_numericality_of :inventory, less_than_or_equal_to: 10

	def display
		"$#{self.denomination}, #{self.inventory}"
	end

	def restock_bills
		self.inventory = 10
		self.save
	end
end
