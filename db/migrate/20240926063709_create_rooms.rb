class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.boolean :is_private, default: false
      t.string :name

      t.timestamps
    end
  end
end
