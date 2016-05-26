class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :date
      t.float :budget
      t.integer :length

      t.timestamps null: false
    end
  end
end
