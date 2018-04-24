class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :photos, array:true
      t.string :expositions, array:true
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
