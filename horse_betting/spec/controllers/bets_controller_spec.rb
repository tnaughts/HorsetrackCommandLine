require 'spec_helper'

describe BetsController do
	let (:horse_data) do
		{  
			:id => 1,
			:number => 1,
			:name => 'Secretariat',
			:odds => 1
		}
	end
	let (:bet_data) do
		{
			:horse_id => 1,
			:bet_amount => 5
		}
	end
	let (:bill_data) do
		{
			:money_id => 1,
			:denomination => 1,
			:inventory => 7
		}
	end
	let(:money){Money.new(id: 1)}
	let(:bill){Bill.new(bill_data)}	
	let(:horse){Horse.new(horse_data)}
	let(:bet){Bet.new(bet_data)}

	describe 'check_bet' do
		it "ensures horse is real" do
			expect(BetsController.check_bet(2, 1)).to eq "Invalid Horse Number: 2"
		end
		it "ensures bet amount is accepted" do
			horse.save
			expect(BetsController.check_bet(1, 1.5)).to eq "Invalid Bet: 1.5"
		end
		it "does not pay a losing horse" do
			horse.save
			expect(BetsController.check_bet(1, 5)).to eq "No Payout: Secretariat"
			horse.horse_won
			horse.save
			bill.save
			money.save
			expect(BetsController.check_bet(1, 5)).to eq "Payout: Secretariat, $5 \nDispensing: \n$1, 5 \n"
		end
	end
	
end