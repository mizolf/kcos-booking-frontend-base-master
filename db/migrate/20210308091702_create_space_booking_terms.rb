class CreateSpaceBookingTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :space_booking_terms do |t|
      t.integer :space_booking_id, index: true
      t.date :date
      t.integer :time_from
      t.integer :time_to
      t.boolean :confirmed

      t.timestamps
    end
  end
end
