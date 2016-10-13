require_relative 'config/environment'

	 
	puts BillsController.show
	puts HorsesController.show

	command = gets.chomp
	command.downcase!
	while command != "q"
		if command[0] = "w"
			HorsesController.update_winner(command[2])
		end 
		puts BillsController.show
		puts HorsesController.show

		command = gets.chomp
	end