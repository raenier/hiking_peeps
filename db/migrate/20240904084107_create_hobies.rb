class CreateHobies < ActiveRecord::Migration[7.1]
  def change
    create_table :hobies do |t|
      t.string :name

      t.timestamps
    end
  end
end
