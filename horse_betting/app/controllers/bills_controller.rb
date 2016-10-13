class BillsController < ApplicationController
	def self.show
		bills = Bill.all
		bill_string = ""
		bills.each do |bill|
			bill_string << "#{bill.display} \n" 
		end
		bill_string
	end
end
