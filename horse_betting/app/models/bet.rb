class Bet < ActiveRecord::Base
	belongs_to :horse
	validates_presence_of :bet_amount, :horse_id
	validates_numericality_of :bet_amount, only_integer: true

	def payout(horse, wagered_amount)
		horse.odds * wagered_amount.to_i
	end

end
