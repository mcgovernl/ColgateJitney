class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :first
      t.string :last
      t.text :destination

      t.timestamps
    end
  end
end
