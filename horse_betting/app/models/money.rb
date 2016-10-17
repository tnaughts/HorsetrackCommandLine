class Money < ActiveRecord::Base
	has_many :bills
	
	def total_cash
		all_bills = self.bills 
		total = 0
		all_bills.each do |bill|
			total += bill.bill_cash
		end
		total
	end
end
