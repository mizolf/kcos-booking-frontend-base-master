class AddStatusToSpaceBookings < ActiveRecord::Migration[5.1]
  def change
  	remove_column :space_booking_terms, :confirmed, :boolean
  	add_column :space_booking_terms, :status, :string, default: :pending
  end
end
