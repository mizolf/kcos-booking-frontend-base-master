class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.string :text
      t.date :publish_at
      t.string :image
      t.string :image_alt
      t.string :slug
      t.string :seo_image
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords
      t.boolean :preview, default: true

      t.timestamps
    end
  end
end
