class CreateGalleryImages < ActiveRecord::Migration[5.1]
  def change
    create_table :gallery_images do |t|
      t.string :landing_page_id
      t.string :image
      t.string :image_alt
      t.integer :position

      t.timestamps
    end
  end
end
