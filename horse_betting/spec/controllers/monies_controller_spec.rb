require 'spec_helper'

describe MoniesController do
	let (:bill_data1) do
		{  
			:money_id => 1,
			:denomination => 1,
			:inventory => 10
		}
	end
	let (:bill_data2) do
		{  
			:money_id => 1,
			:denomination => 5,
			:inventory => 10
		}
	end
	let (:bill_data3) do
		{  
			:money_id => 1,
			:denomination => 10,
			:inventory => 10
		}
	end
	let (:bill_data4) do
		{  
			:money_id => 1,
			:denomination => 20,
			:inventory => 10
		}
	end
	let(:money){Money.new(id: 1)}
	let(:bill1){Bill.new(bill_data1)}
	let(:bill2){Bill.new(bill_data2)}
	let(:bill3){Bill.new(bill_data3)}
	let(:bill3){Bill.new(bill_data4)}

	# describe 'sub_from_inventory' do
	# 	it
	# end


end