class AddWinnerToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :winner, :boolean, default: false
  end
end
