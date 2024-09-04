class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.integer :gender
      t.date :bday
      t.string :address

      t.timestamps
    end
  end
end
