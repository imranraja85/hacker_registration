class AddWinner < ActiveRecord::Migration[5.0]
  def change
    add_column :hackers, :winner, :boolean, null: false, default: false
  end
end
