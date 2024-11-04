class CreateTinymcePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :tinymce_pictures do |t|
      t.string :file

      t.timestamps
    end
  end
end
