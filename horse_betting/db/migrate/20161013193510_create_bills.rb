class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    	t.integer :money_id, {null: false}
    	t.integer :inventory, {null: false}
    	t.integer :denomination, {null: false}

      t.timestamps null: false
    end
  end
end
