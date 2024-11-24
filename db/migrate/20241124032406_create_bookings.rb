class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.integer :passengers_number
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
