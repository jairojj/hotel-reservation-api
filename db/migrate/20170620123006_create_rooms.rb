class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :max_quantity
      t.decimal :daily_price
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
