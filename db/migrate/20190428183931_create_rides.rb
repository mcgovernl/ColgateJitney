class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :start
      t.string :destination
      t.boolean :done
      t.boolean :reviewed
      t.references :driver, foreign_key: true
      t.references :rider, foreign_key: true

      t.timestamps
    end
  end
end
