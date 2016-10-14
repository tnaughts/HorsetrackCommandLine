require 'spec_helper'

describe BillsController do
	let (:bill_data1) do
		{  
			:money_id => 1,
			:denomination => 5,
			:inventory => 7
		}
	end
	let (:bill_data2) do
		{  
			:money_id => 1,
			:denomination => 10,
			:inventory => 4
		}
	end

	let(:bill1){Bill.create(bill_data1)}
	let(:bill2){Bill.create(bill_data2)}

	describe '.show' do
		it 'returns a string of all of the bills and denominations' do
			bill1.save
			bill2.save
			expect(BillsController.show).to eq "Inventory: \n$5, 7 \n$10, 4 \n"
		end
	end
	
	
end