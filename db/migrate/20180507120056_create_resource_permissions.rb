class CreateResourcePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_permissions do |t|
      t.integer :admin_id
      t.string :resource
      t.boolean :permitted, default: false

      t.timestamps
    end
  end
end
