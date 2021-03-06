class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :description
      t.references :driver
      t.references :rider
      t.references :ride

      t.timestamps
    end
  end
end
