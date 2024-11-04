class AddSeenAtToSpaceBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :space_bookings, :seen_at, :datetime
    add_column :space_bookings, :other, :string
    add_column :space_bookings, :finished, :boolean, default: false
  end
end
