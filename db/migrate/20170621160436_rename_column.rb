class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :room_id_id, :room_id
    rename_column :reservations, :user_id_id, :user_id
  end
end
