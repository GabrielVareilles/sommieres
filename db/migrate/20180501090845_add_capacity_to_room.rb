class AddCapacityToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :capacity, :integer
  end
end
