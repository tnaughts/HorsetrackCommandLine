class HorsesController < ApplicationController
	def self.show
		horses = Horse.all
		horses_string = ""
		horses.each do |horse|
			horses_string << "#{horse.display}"
		end
		horses_string
	end
end
