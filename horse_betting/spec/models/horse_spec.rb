require 'spec_helper'

describe Horse do
  	let (:horse_data) do
  		{  :number => 1,
  			:name => 'Secretariat',
  			:odds => 5,
  		}
  	end
  	let(:horse){Horse.new(horse_data)}

  	describe 'attributes' do
  		it "has a readable attributes" do
        # horse = Horse.new(:horse_data)
  			expect(horse.number).to eq 1
        expect(horse.name).to eq 'Secretariat'
        expect(horse.odds).to eq 5
        
  		end
      it "has writable attributes" do
        horse.number = 2
        horse.name = 'Seabiscuit'
        horse.winner = true
        horse.odds = 8
        expect(horse.number).to eq 2
        expect(horse.name).to eq 'Seabiscuit'
        expect(horse.winner).to eq true
        expect(horse.odds).to eq 8
      end
      it "has a id and default winner of false on save" do
        expect(horse.id).to eq nil
        horse.save
        expect(horse.winner).to eq false
      end
      it "can be checked if won or lost" do
        expect(horse.did_win).to eq "Lost"
        horse.horse_won
        expect(horse.did_win).to eq "Won"
        horse.horse_lost
        expect(horse.did_win).to eq "Lost"
      end
      it "can display its attributes in a string" do
        expect(horse.display).to eq "1, Secretariat, 5, Lost \n"
      end

  	end
    describe 'associations' do
      it { should have_many(:bets) }
    end
  end