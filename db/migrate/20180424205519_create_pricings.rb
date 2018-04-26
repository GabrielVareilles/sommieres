class CreatePricings < ActiveRecord::Migration[5.2]
  def change
    create_table :pricings do |t|
      t.text :name
      t.text :description
      t.integer :price_cents

      t.timestamps
    end
  end
end
