class CreateLegalPages < ActiveRecord::Migration[5.1]
  def change
    create_table :legal_pages do |t|
 			t.string :name
 			t.string :slug
 			t.string :title
 			t.string :content
 			t.integer :position
 			t.boolean :list, default: true
 			t.string :seo_description
 			t.string :seo_keywords
 			t.string :seo_title
      t.timestamps
    end
  end
end
