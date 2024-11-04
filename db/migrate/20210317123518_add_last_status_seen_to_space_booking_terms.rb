class AddLastStatusSeenToSpaceBookingTerms < ActiveRecord::Migration[5.1]
  def change
    add_column :space_booking_terms, :last_status_seen, :string, default: 'pending'
    add_column :space_bookings, :last_status_seen_updated_at, :datetime
  end
end
