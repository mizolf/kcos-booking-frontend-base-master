class CreatePageMetaTags < ActiveRecord::Migration[5.1]
  def change
    create_table :page_meta_tags do |t|
      t.string :title
      t.string :og_title
      t.string :description
      t.string :keywords
      t.string :image
      t.string :page

      t.timestamps
    end
  end
end
