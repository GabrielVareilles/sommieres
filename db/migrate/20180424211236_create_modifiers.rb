class CreateModifiers < ActiveRecord::Migration[5.2]
  def change
    create_table :modifiers do |t|
      t.text :name
      t.text :description
      t.integer :percent
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
