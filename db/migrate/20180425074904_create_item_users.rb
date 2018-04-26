class CreateItemUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_users do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :pricing, foreign_key: true
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
