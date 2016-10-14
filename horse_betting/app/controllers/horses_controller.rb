
class HorsesController < ApplicationController
	def self.show
		horses = Horse.order(:number)
		horses_string = "Horses: \n"
		horses.each do |horse|
			horses_string << "#{horse.display}"
		end
		horses_string
	end

	def self.update_winner(number)
		winning_number = number.to_i
		horses = Horse.order(:number)
		# if horses[0].number > winning_number || horses[-1].number < winning_number
		# 	return false
		# end
		return false if !self.horse_exists(number)
		horses.each do |horse|
			if horse.number == winning_number
				horse.horse_won
			else
				horse.horse_lost
			end
		end
		true
	end

	def self.horse_exists(horse_number)
		Horse.find_by(number: horse_number) != nil
	end
end
