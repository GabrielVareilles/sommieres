class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :photos, array:true
      t.text :description

      t.timestamps
    end
  end
end
