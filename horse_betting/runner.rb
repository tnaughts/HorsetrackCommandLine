require_relative 'config/environment'

	 
	puts BillsController.show
	puts HorsesController.show

	command = gets.chomp
	command.downcase!
	while command != "q"
		command = gets.chomp
	end