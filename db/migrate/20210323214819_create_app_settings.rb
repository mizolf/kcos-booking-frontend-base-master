class CreateAppSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :app_settings do |t|
      t.string :space_booking_consent
      t.string :space_rent_consent

      t.timestamps
    end
  end
end
