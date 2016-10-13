class Horse < ActiveRecord::Base
	validates_presence_of :odds, :number, :name
	validates_uniqueness_of :name, :number

end
