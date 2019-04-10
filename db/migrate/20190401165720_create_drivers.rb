class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first
      t.string :last
      t.string :make
      t.string :model
      t.string :plate
      t.integer :seats
      t.boolean :available
      t.references :user
      #t.decimal :price
      t.timestamps
    end
  end
end
