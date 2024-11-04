class CreateSpaceBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :space_bookings do |t|
      t.integer :space_id, index: true
      t.string :first_name
      t.string :last_name
      t.string :organisation
      t.string :phone
      t.string :email
      t.string :people_count
      t.string :purpose

      t.timestamps
    end
  end
end
