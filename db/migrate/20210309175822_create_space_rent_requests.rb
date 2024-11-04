class CreateSpaceRentRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :space_rent_requests do |t|
      t.integer :space_id, index: true
      t.string :first_name
      t.string :last_name
      t.string :organisation
      t.string :phone
      t.string :email
      t.string :people_count
      t.string :work_plan
      t.string :work_goal
      t.string :partners
      t.string :other
      t.string :token
      t.datetime :seen_at

      t.timestamps
    end
  end
end
