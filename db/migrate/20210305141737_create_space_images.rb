class CreateSpaceImages < ActiveRecord::Migration[5.1]
  def change
    create_table :space_images do |t|
      t.integer :space_id, index: true
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
