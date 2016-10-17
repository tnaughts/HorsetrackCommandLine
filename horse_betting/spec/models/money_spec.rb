require 'spec_helper'

describe Money do
	let (:bill_data1) do
		{  
			:money_id => 1,
			:denomination => 5,
			:inventory => 10
		}
	end
	let (:bill_data2) do
		{  
			:money_id => 1,
			:denomination => 10,
			:inventory => 10
		}
	end
	let(:money){Money.new(id: 1)}
	
	let(:bill1){Bill.new(bill_data1)}
	
	let(:bill2){Bill.new(bill_data2)}


	describe 'associations' do
    	it { should have_many(:bills) }
    end
    describe 'attributes' do
    	it "has readable cash" do
    		money.save
    		bill1.save
    		bill2.save
    		expect(money.total_cash).to eq 150
    	end

    end
end
