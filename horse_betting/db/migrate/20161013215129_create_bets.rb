class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
    	t.integer :bet_amount, {null: false}
    	t.integer :horse_id, {null: false}
     	t.timestamps null: false
    end
  end
end
