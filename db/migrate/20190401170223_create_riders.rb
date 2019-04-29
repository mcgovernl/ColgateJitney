class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :first
      t.string :last
      t.text :start
      t.text :destination
      t.references :user
      t.timestamps
    end
  end
end
