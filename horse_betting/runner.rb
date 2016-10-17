require_relative 'config/environment'

	 
	puts BillsController.show 
	puts HorsesController.show

	command = gets.chomp
	command.downcase! #normailize inputs
	while command != "q"
		if command[0] == "w"
			if !(HorsesController.update_winner(command[2..-1]))
				puts "Invalid Horse Number: #{command[2..-1]}"
			end
		elsif command[0] == "r" && command.length == 1 #restocking
			BillsController.restock
		elsif /^\d/ === command  #utilized regex so that more accurate error messages can be displayed
			puts BetsController.check_bet(command[0], command[2..-1])
		else
			puts "Invalid command: #{command}"
		end 
		puts BillsController.show
		puts HorsesController.show
		command = gets.chomp
		command.downcase!
	end