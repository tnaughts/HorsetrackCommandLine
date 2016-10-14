class BetsController < ApplicationController
	def self.check_bet(horse_number, wagered_amount)
		payout_string = "Payout: "
		betted_horse = Horse.find_by(number: horse_number)
		if  betted_horse != nil
			bet = Bet.new(horse_id: betted_horse.id, bet_amount: wagered_amount)
			if bet.save
				if betted_horse.winner?
					payout_string << "#{betted_horse.name}, $#{bet.payout(betted_horse, wagered_amount)} \n"
					payout_string << MoniesController.dispense(bet.payout(betted_horse, wagered_amount))
				else
					return "No Payout: #{betted_horse.name}"	
				end
			else
				return "Invalid Bet: #{wagered_amount}"
			end
		else
			return "Invalid Horse Number: #{horse_number}"
		end
		payout_string



	end

	
end
