class BillsController < ApplicationController
	def self.show
		bills = Bill.order(:denomination)
		bill_string = "Inventory: \n"
		bills.each do |bill|
			bill_string << "#{bill.display} \n" 
		end
		bill_string
	end

	def self.restock
		bills = Bill.all
		bills.each do |bill|
			bill.restock_bills
		end
	end
end
