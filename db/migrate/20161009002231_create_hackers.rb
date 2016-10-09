class CreateHackers < ActiveRecord::Migration[5.0]
  def change
    create_table :hackers do |t|
      t.string :first_name
      t.string :last_name
      t.string :github_id
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
