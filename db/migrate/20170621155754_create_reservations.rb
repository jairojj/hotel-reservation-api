class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.decimal :total_price
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
