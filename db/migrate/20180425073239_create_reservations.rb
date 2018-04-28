class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :modifier, foreign_key: true
      t.date :start
      t.date :stop

      t.timestamps
    end
  end
end
