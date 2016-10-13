class BetsController < ApplicationController
	def self.check_bet(horse_number, wagered_amount)
		payout_string = "Payout: "
		horse = Horse.find_by(number: horse_number)
		if  horse != nil
			bet = Bet.new(horse_id: horse.id, bet_amount: wagered_amount)
			if bet.save
				if horse.winner?
					payout_string << "#{horse.name}, $#{bet.payout(horse, wagered_amount)}"
				else
					return "No Payout: #{horse.name}"	
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
