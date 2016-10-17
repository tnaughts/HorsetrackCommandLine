class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|

    	t.integer :number, {null: false}
    	t.string :name, {null: false}
    	t.integer :odds, {null: false}

		t.timestamps null: false
    end
  end
end
