class MoniesController < ApplicationController
	def self.dispense(amount)
		dispensed_list = "Dispensing: \n"
		m = Money.first
		all_bills = m.bills.order(denomination: :desc)
		if amount > m.total_cash
			return "Insufficient funds: $#{amount}"
		end
		i = 0
		to_be_paid = amount
		while to_be_paid > 0 && i < all_bills.length
			to_be_paid = sub_from_inventory(all_bills[i], to_be_paid, dispensed_list)
			i += 1
		end
		if to_be_paid > 0
			return "Insufficient Funds: $#{amount}"
		end
		dispensed_list
	end

	def self.sub_from_inventory(bill, amount, dispensed_list)

		divisor = amount/bill.denomination
		num_bills_dispensed = 0
		if (divisor > 0) && (bill.inventory > 0)
			if bill.inventory >= divisor
				bill.inventory -= divisor
				amount -= bill.denomination * divisor
				bill.save
				num_bills_dispensed = divisor
			else
				amount -= bill.bill_cash
				num_bills_dispensed = bill.inventory
				bill.inventory = 0
				bill.save
			end

		end
		dispensed_list.insert(13, "$#{bill.denomination}, #{num_bills_dispensed} \n")
		amount

	end
end
