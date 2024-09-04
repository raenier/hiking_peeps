class CreateJoinTableHobiesProfile < ActiveRecord::Migration[7.1]
  def change
    create_join_table :hobies, :profiles
  end
end
