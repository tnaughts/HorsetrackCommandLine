class MoniesController < ApplicationController
	def self.dispense(amount)
		dispensed_list = "Dispensing: \n"
		m = Money.first
		all_bills = m.bills.order(denomination: :desc) #ensure bills are greatest to least for dispesing
		return "Insufficient funds: $#{amount}" if amount > m.total_cash
		i = 0
		to_be_paid = amount
		while to_be_paid > 0 && i < all_bills.length
			to_be_paid = sub_from_inventory(all_bills[i], to_be_paid, dispensed_list)
			i += 1
		end
		return "Insufficient Funds: $#{amount}" if to_be_paid > 0
		dispensed_list
	end

	def self.sub_from_inventory(bill, amount, dispensed_list)
		divisor = amount/bill.denomination
		num_bills_dispensed = 0
		if (divisor > 0) && (bill.inventory > 0) #confirm that divisor is greater than one and there are bills
			if bill.inventory >= divisor
				bill.inventory -= divisor
				amount -= bill.denomination * divisor
				bill.save
				num_bills_dispensed = divisor
			else #catch case if not enough bills
				amount -= bill.bill_cash
				num_bills_dispensed = bill.inventory
				bill.inventory = 0
				bill.save
			end
		end
		dispensed_list.insert(13, "$#{bill.denomination}, #{num_bills_dispensed} \n") #inserting strings
		amount
	end
end
