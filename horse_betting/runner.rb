require_relative 'config/environment'

	 
	puts BillsController.show
	puts HorsesController.show

	command = gets.chomp
	command.downcase!
	p command
	while command != "q"
		if command[0] == "w"
			HorsesController.update_winner(command[2])
		elsif command[0] == "r"
			BillsController.restock
		elsif /^\d/ === command
			puts BetsController.check_bet(command[0], command[2..-1])
		else
			puts "Invalid command: #{command}"
		end 
		puts BillsController.show
		puts HorsesController.show

		command = gets.chomp
	end