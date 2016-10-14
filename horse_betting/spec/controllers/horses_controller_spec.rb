require 'spec_helper'

describe HorsesController do
	
	let (:horse_data) do
  		{  :number => 1,
  			:name => 'Secretariat',
  			:odds => 5
  			
  		}
  	end
  	let (:horse_data2) do
  		{  :number => 2,
  			:name => 'Nyquist',
  			:odds => 4

  		}
  	end
  	let(:horse1){Horse.new(horse_data)}
  	let(:horse2){Horse.new(horse_data2)}

  	describe '.show' do
  		it 'returns a string of the horses' do
  			horse1.save
  			horse2.save
  			expect(HorsesController.show).to eq "Horses: \n1, Secretariat, 5, Lost \n2, Nyquist, 4, Lost \n"
  		end
  	end
  	describe '.horse_exists' do
  		it 'returns true if horse exists' do
  			horse1.save
  			expect(HorsesController.horse_exists('1')).to eq true
  			expect(HorsesController.horse_exists('5')).to eq false

  			
  		end
  	end
end