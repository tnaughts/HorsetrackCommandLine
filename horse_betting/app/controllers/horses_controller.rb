
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
		horses = Horse.all
		horses.each do |horse|
			if horse.number == winning_number
				horse.horse_won
			else
				horse.horse_lost
			end
		end
	end
end
