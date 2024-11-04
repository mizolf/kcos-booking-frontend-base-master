class AddTokenToSpaceBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :space_bookings, :token, :string
  end
end
