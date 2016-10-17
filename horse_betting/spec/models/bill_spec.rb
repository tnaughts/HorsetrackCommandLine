require 'spec_helper'

describe Bill do
	let (:bill_data) do
		{  
			:money_id => 1,
			:denomination => 11,
			:inventory => 10
		}
	end
	
	let(:bill){Bill.new(bill_data)}



	describe 'associations' do
    	it { should belong_to(:money) }
    end
    describe 'validations' do
    	it { should validate_presence_of(:money_id)}
    	it { should validate_presence_of(:inventory)}
    	it { should validate_presence_of(:denomination)}
    	it { should validate_numericality_of(:inventory)}
    end
    describe 'attributes' do
    	it 'has readable attributes' do
    		expect(bill.denomination).to eq 11
    		expect(bill.inventory).to eq 10
    		expect(bill.bill_cash).to eq 110
    	end
    	it 'restocks inventory' do
    		bill.inventory = 5
    		expect(bill.inventory).to eq 5
    		bill.restock_bills
    		expect(bill.inventory).to eq 10
    	end
    	it 'displays a string of the denomination and inventory' do
    		expect(bill.display).to eq "$11, 10"
    	end

    end
end
