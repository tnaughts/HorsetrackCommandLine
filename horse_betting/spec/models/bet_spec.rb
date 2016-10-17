require 'spec_helper'

describe Bet do
	let (:horse_data) do
		{  
			:id => 1,
			:number => 1,
			:name => 'Secretariat',
			:odds => 5
		}
	end
	let (:bet_data) do
		{
			:horse_id => 1,
			:bet_amount => 5
		}
	end
	let(:horse){Horse.new(horse_data)}
	let(:bet){Bet.new(bet_data)}

	describe "attributes" do
		it "has readable attributes" do
			expect(bet.bet_amount).to eq 5
			expect(bet.horse_id).to eq 1
		end
		it "calculates payout" do
			bet.save
			horse.save
			expect(bet.payout).to eq 25
		end

	end
	describe 'associations' do
      it { should belong_to(:horse) }

    end
    describe 'validations' do
      it { should validate_presence_of(:bet_amount) }
      it { should validate_presence_of(:horse_id) }
      it { should validate_numericality_of(:bet_amount) }
    end

end